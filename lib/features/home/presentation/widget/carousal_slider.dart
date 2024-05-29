import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/home/manager/home_cubit.dart';
import 'package:book_store/features/home/manager/home_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarousalSlider extends StatelessWidget {
  const CarousalSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, HomeStates state) {},
      builder: (BuildContext context, HomeStates state) {
        var cubit = HomeCubit.get(context);

        return cubit.sliderModel.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CarouselSlider.builder(
              
                itemCount: cubit.sliderModel.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.network(cubit.sliderModel[index].image!,
                      // news?[index].urlToImage ??

                      height: 100, errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                        height: 50,
                        child: Icon(
                          Icons.error,
                          color: AppColors.black,
                        ));
                  });
                },
                options: CarouselOptions(
                  height: 50,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ));
      },
    );
  }
}

// class SliderTwoItem extends StatelessWidget {
//   const SliderTwoItem({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return 
 
//   }
//}
