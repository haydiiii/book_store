import 'dart:developer';
import 'package:book_store/core/cache/cache_helper.dart';
import 'package:book_store/core/services/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:book_store/features/home/data/model/best_seller_model.dart';
import 'package:book_store/features/home/data/model/categories_model.dart';
import 'package:book_store/features/home/data/model/new_arrivals_model.dart';
import 'package:book_store/features/home/data/model/sliders_model.dart';
import 'package:book_store/features/home/manager/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(IntialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Sliders> sliderModel = [];
  List<Products> bestSeller = [];
  List<Preoductss> newArrivals = [];
  List<Categories> categories = [];
  Future<void> sliderData() async {
    emit(LoadingSliderData());
    final response = await DioHelper().getData(
        url: EndPoints.slider, token: CacheHelper.getData(key: 'token'));
    print('response is ${response.data}');

    if (response.statusCode == 200) {
      SliderModel slider = SliderModel.fromJson(response.data);
      sliderModel = [...slider.data!.sliders!];
      // for (var item in response.data) {
      //   sliderModel?.add(SliderModel.fromJson(item));
      // }
      emit(SuccessSliderData());
    } else {
      emit(ErrorSliderData());
      log(response.data);
    }
  }

  Future<void> bestSellerData() async {
    emit(LoadingBestSellerData());
    final response = await DioHelper().getData(
        url: EndPoints.bestSeller, token: CacheHelper.getData(key: 'token'));
    print('response is ${response.data}');
    if (response.statusCode == 200) {
      BestSellerModel bestSellerModel = BestSellerModel.fromJson(response.data);
      bestSeller = [...bestSellerModel.data!.products!];
      // for (var item in response.data['data']['products']) {
      //   bestSeller?.add(Products.fromJson(item));
      // }
      emit(SuccessBestSellerData());
    } else {
      emit(ErrorBestSellerData());
      log(response.data);
    }
  }
  Future<void> newsArrivalData() async {
    emit(LoadingNewArrivalsData());
    final response = await DioHelper().getData(
        url: EndPoints.newArrivals, token: CacheHelper.getData(key: 'token'));
    print('response is ${response.data}');
    if (response.statusCode == 200) {
      NewArrivalsModel newArrivalsModel = NewArrivalsModel.fromJson(response.data);
     newArrivals  = [...newArrivalsModel.data!.products!];
      // for (var item in response.data['data']['products']) {
      //   bestSeller?.add(Products.fromJson(item));
      // }
      emit(SuccessNewArrivalsData());
    } else {
      emit(ErrorNewArrivalsData());
      log(response.data);
    }
  }
  Future<void> categoriesData() async {
    emit(LoadingCategorieData());
    final response = await DioHelper().getData(
        url: EndPoints.categories, token: CacheHelper.getData(key: 'token'));
    print('response is ${response.data}');
    if (response.statusCode == 200) {
      CategoriesModel categoriesModel = CategoriesModel.fromJson(response.data);
     categories  = [...categoriesModel.data!.categories!];
      // for (var item in response.data['data']['products']) {
      //   bestSeller?.add(Products.fromJson(item));
      // }
      emit(SuccessNewArrivalsData());
    } else {
      emit(ErrorNewArrivalsData());
      log(response.data);
    }
  }
}
