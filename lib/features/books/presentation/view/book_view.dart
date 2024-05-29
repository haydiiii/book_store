import 'package:book_store/core/utils/text_style.dart';
import 'package:book_store/features/books/manager/books_cubit.dart';
import 'package:book_store/features/books/manager/books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksView extends StatelessWidget {
  const BooksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) {
            return BooksCubit()..getBooks();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BlocConsumer<BooksCubit, BooksState>(
                  listener: (BuildContext context, BooksState state) {},
                  builder: (BuildContext context, BooksState state) {
                    var cubit = BooksCubit.get(context);
                    return ListView.builder(
                      itemCount: cubit.booksModel!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                cubit.booksModel![index]
                                    .image!, // Replace with your image URL
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            style: getTitleStyle(), // نمط مثالي
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: cubit.booksModel![index]
                                                            .name !=
                                                        null
                                                    ? cubit.booksModel![index]
                                                        .name!
                                                        .substring(0,
                                                            13) // عرض الأحرف الثلاثة الأولى
                                                    : 'N/A',
                                              ),
                                              const TextSpan(
                                                text: '...', // النقاط
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          cubit.booksModel![index].category!,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text(
                                              cubit.booksModel![index].price!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              cubit.booksModel![index]
                                                  .priceAfterDiscount!
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.teal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                    const SizedBox(width: 2),
                                    Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                icon: const Icon(Icons
                                                    .favorite_border_outlined),
                                                onPressed: () {
                                                  // Add to cart action
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                icon: const Icon(Icons
                                                    .shopping_cart_outlined),
                                                onPressed: () {
                                                  // Add to cart action
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
