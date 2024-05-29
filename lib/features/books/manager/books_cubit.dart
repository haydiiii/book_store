import 'package:book_store/core/services/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:book_store/features/books/manager/books_states.dart';
import 'package:book_store/features/books/model/books_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  static BooksCubit get(context) => BlocProvider.of(context);
  List<Products>? booksModel = [];

  Future<void> getBooks() async {
    emit(LoadingBookState());
    final response = await DioHelper().getData(
      url: EndPoints.products,
    );
    if (response.statusCode == 200) {
      BooksModel books = BooksModel.fromJson(response.data);
      booksModel = [...books.data!.products!];
      emit(SuccessBookState());
    } else {
      emit(ErrorBookState(
        message: response.data['message'],
      ));
    }
  }
}
