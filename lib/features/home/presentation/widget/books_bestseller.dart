import 'package:book_store/core/utils/text_style.dart';
import 'package:book_store/features/home/manager/home_cubit.dart';
import 'package:book_store/features/home/manager/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BooksBestSeller extends StatelessWidget {
  const BooksBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, HomeStates state) {},
      builder: (BuildContext context, HomeStates state) {
        var cubit = HomeCubit.get(context);
        // Collect all products from each BestSellerModel's data

        return Column(
          children: [
            SizedBox(
              height: 300, // Adjusted height to accommodate image and text
              child: ListView.builder(
                itemCount: cubit.bestSeller.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height:
                              140, // Adjusted height to fit within the SizedBox
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(cubit.bestSeller[index]
                                  .image!), // Ensure this is a valid URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Gap(5),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 8.0), // قد ترغب في تعديل هذه القيمة
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: getTitleStyle(), // نمط مثالي
                              children: <TextSpan>[
                                TextSpan(
                                  text: cubit.bestSeller[index].name != null
                                      ? cubit.bestSeller[index].name!.substring(
                                          0, 10) // عرض الأحرف الثلاثة الأولى
                                      : 'N/A',
                                ),
                                const TextSpan(
                                  text: '...', // النقاط
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          cubit.bestSeller[index].category ?? 'N/A',
                          style: getSmallStyle(), // Example style
                        ),
                        Text(
                          cubit.bestSeller[index].price ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ), // Example style
                        ),
                        Text(
                          cubit.bestSeller[index].priceAfterDiscount
                                  ?.toString() ??
                              'N/A',
                          style: const TextStyle(fontSize: 14), // Example style
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
