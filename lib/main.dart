import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/bloc/auth/auth_bloc.dart';
import 'package:myapp/bloc/books/books_bloc.dart';
import 'package:myapp/pages/app_shell.dart';
import 'package:myapp/pages/book_details.dart';
import 'package:myapp/pages/books_list.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/profile_page.dart';

const LOGIN_PATH = "/login";
const BY_AUTHOR_PATH = "/byAuthor";
const BY_TITLE_PATH = "/byTitle";
const PROFILE_PATH = "/profile";
const DETAILS_PATH = "/details";

main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BooksBloc()),
      BlocProvider(create: (context) => AuthBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return MaterialApp.router(
            title: 'Books App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: GoRouter(
              initialLocation: LOGIN_PATH,
              routes: [
                ShellRoute(
                  navigatorKey: GlobalKey<NavigatorState>(),
                  builder: (context, state, child) {
                    return AppShell(child: child);
                  },
                  routes: [
                    GoRoute(
                        path: BY_AUTHOR_PATH,
                        builder: (context, state) {
                          return const BooksList();
                        }),
                    GoRoute(
                        path: BY_TITLE_PATH,
                        builder: (context, state) {
                          return const BooksList();
                        }),
                    GoRoute(
                      path: PROFILE_PATH,
                      builder: (context, state) {
                        return const ProfilePage();
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: DETAILS_PATH,
                  builder: (context, state) {
                    Book book = state.extra as Book;
                    return DetailsPage(book: book);
                  },
                ),
                GoRoute(
                  path: LOGIN_PATH,
                  builder: (context, state) {
                    return const LoginPage();
                  },
                ),
              ],
              redirect: (context, state) {
                bool isLoggingIn = state.fullPath == LOGIN_PATH;
                if (authState is LoggedOutState) {
                  return LOGIN_PATH;
                }
                if (authState is LoggedInState && isLoggingIn) {
                  return BY_AUTHOR_PATH;
                }
                return null;
              },
            ));
      },
    );
  }
}
