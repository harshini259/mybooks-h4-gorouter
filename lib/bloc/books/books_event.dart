part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}
class sortByAuthor extends BooksEvent {}
class sortByTitle extends BooksEvent {}


