class BooksState {}

class BooksInitial extends BooksState {}  
class LoadingBookState extends BooksState {}
class SuccessBookState extends BooksState {}
class ErrorBookState extends BooksState {
  final String message;

  ErrorBookState({required this.message});
}
