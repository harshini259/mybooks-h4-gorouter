import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/bloc/books/books_bloc.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_outlined),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: const Text('Books'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "By Author",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.text_fields), label: "By Title"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Profile"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.read<BooksBloc>().add(sortByAuthor());
              context.go('/byAuthor');
              break;
            case 1:
              context.read<BooksBloc>().add(sortByTitle());
              context.go('/byTitle');
              break;
            case 2:
              context.read<BooksBloc>().add(sortByTitle());
              context.go('/profile');
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
