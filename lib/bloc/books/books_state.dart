part of 'books_bloc.dart';

class BooksState {
  final List<Book> books;
  BooksState({required this.books});
}

class Book {
  final String title;
  final String author;
  Book({required this.title, required this.author});
}
