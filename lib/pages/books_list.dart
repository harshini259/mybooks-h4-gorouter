import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/bloc/books/books_bloc.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        return ListView(children: [
          for (var book in state.books)
            GestureDetector(
              onTap: () {
                context.push('/details', extra: book);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: ListTile(
                  tileColor: theme.colorScheme.primaryContainer,
                  title: Text(book.title),
                  subtitle: Text(book.author),
                ),
              ),
            )
        ]);
      },
    );
  }
}
