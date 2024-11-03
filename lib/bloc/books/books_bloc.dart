import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

final List<Book> books = [
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
  ),
  Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
  ),
  Book(
    title: 'Moby Dick',
    author: 'Herman Melville',
  ),
  Book(
    title: 'Pride and Prejudice',
    author: 'Jane Austen',
  ),
  Book(
    title: 'The Catcher in the Rye',
    author: 'J.D. Salinger',
  ),
];

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksState(books: books)) {
    on<BooksEvent>((event, emit) {
      var newlist = books;
      if (event is sortByAuthor) {
        newlist.sort((a, b) => a.author.compareTo(b.author));
      }
      if (event is sortByTitle) {
        newlist.sort((a, b) => a.title.compareTo(b.title));
      }
      emit(BooksState(books: newlist));
    });
  }
}
