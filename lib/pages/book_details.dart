import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/bloc/books/books_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Book book;
  const DetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_outlined),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: const Text('Book'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
          ),
          ListTile(
            title: Text(book.author),
          ),
        ],
      ),
    );
  }
}
