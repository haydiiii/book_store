import 'package:book_store/features/home/manager/home_cubit.dart';
import 'package:book_store/features/home/manager/home_states.dart';
import 'package:book_store/features/home/presentation/widget/books_bestseller.dart';
import 'package:book_store/features/home/presentation/widget/carousal_slider.dart';
import 'package:book_store/features/home/presentation/widget/home_header.dart';
import 'package:book_store/features/home/presentation/widget/new_arrivals.dart';
import 'package:book_store/features/home/presentation/widget/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (BuildContext context) {
        return HomeCubit()
          ..sliderData()
          ..bestSellerData()
          ..newsArrivalData()
          ..categoriesData();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const HomeHeader(),
                const Gap(10),
                const CarousalSlider(),
                const TextTitleWidget(
                  text: 'Best Seller',
                ),
                const BooksBestSeller(
                    // bookName: 'Algorithms',
                    // categoryName: 'Computer Science',
                    // price: 100,
                    // priceAfterSale: 80,
                    ),
                const CarousalSlider(),
                const TextTitleWidget(
                  text: 'Categories',
                ),
                SizedBox(
                  height: 100,
                  child: BlocConsumer< HomeCubit, HomeStates>(
                    listener: (BuildContext context,     HomeStates    state) {},
                    builder: (BuildContext context, HomeStates state) {
                      var cubit = HomeCubit.get(context);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,

                        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //   crossAxisCount: 4,
                        //   crossAxisSpacing: 5,
                        //   mainAxisSpacing: 5,
                        //   childAspectRatio: 0.75,
                        // ),
                        itemCount: cubit.categories.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SizedBox(
                              width: 100,
                              height: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      'https://i.pinimg.com/564x/e6/3e/40/e63e40b44b6d788dad3b7ab3b7a158cb.jpg',
                                      height: 30,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    cubit.categories[index].name!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const TextTitleWidget(
                  text: 'New Arrivals',
                ),
                const NewArrivals(

                    // bookName: 'Algorithms',
                    // categoryName: 'Computer Science',
                    // price: 100,
                    // priceAfterSale: 80,
                    ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
