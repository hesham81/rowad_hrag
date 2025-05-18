import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_all_special_products.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_second_banner.dart';
import '/core/route/route_names.dart';
import '/features/layout/data/models/category_data_model.dart';
import '/features/sub_categories/data/models/sub_categories_data_model.dart';
import '/features/layout/domain/entities/reviews.dart';
import '/features/layout/domain/use_cases/get_all_banners.dart';
import '/features/layout/domain/use_cases/get_all_reviews_use_case.dart';
import '/features/layout/domain/entities/banner.dart';
import '/core/services/web_services.dart';
import '/features/layout/data/data_sources/remote_home_data_source.dart';
import '/features/layout/data/repositories/home_reposatories_implementation.dart';
import '/features/layout/domain/use_cases/get_all_categories.dart';
import '../../data/data_sources/home_interface_data_source.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/home_reposatory.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    Future.wait([
      getAllCategories(),
      getAllBanners(),
      getAllReviews(),
      getAllSpecialProducts(),
      getSecondBanner()
    ]);
  }


  bool isLoading = true;
  List<ProductsDataModel> _specialProducts = [];

  late GetAllCategoriesUseCase _getAllCategoriesUseCase;
  late HomeInterfaceDataSource _interfaceDataSource;
  late HomeReposatory _homeReposatory;
  late WebServices _services;
  late GetAllBannersUseCase _getAllBannersUseCase;
  late GetAllReviewsUseCase _getAllReviewsUseCase;
  late GetAllSpecialProducts _getAllSpecialProductsUseCase;
  late GetSecondBannerUseCase _getSecondBannerUseCase;

  List<Reviews> _reviews = [];

  List<BannerEntity> _banners = [];
  List<BannerEntity> _secondBanner = [];

  List<BannerEntity> get secondBanner => _secondBanner;

  List<Category> _categories = [];
  bool _specialProductsLoading = true;

  bool get specialProductsLoading => _specialProductsLoading;

  List<Category> get categories => _categories;

  List<ProductsDataModel> get specialProducts => _specialProducts;

  List<BannerEntity> get banners => _banners;

  bool _isBannersLoading = true;

  bool get isBannersLoading => _isBannersLoading;

  List<Reviews> get reviews => _reviews;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    emit(HomeInitial());
  }

  var pages = [
    RouteNames.home,
    RouteNames.blogs,
    RouteNames.allTypes,
    RouteNames.bills,
    RouteNames.addAdds,
    RouteNames.plans,
    RouteNames.contactWithSupport,
    RouteNames.profile,
  ];

  List<CategoryDataModel> _categoriesData = [];

  List<CategoryDataModel> get categoriesData => _categoriesData;

  Future<void> getAllCategories() async {
    try {
      EasyLoading.show();
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getAllCategoriesUseCase = GetAllCategoriesUseCase(_homeReposatory);
      var response = await _getAllCategoriesUseCase.call();
      response.fold(
        (error) {
          throw Exception("${error.messageAr} ${error.messageEn}");
        },
        (list) {
          emit(
            HomeLoaded(list),
          );
        },
      );
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getAllBanners() async {
    _services = WebServices();
    _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
    _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
    _getAllBannersUseCase = GetAllBannersUseCase(_homeReposatory);
    var response = await _getAllBannersUseCase.call();
    _isBannersLoading = false;
    response.fold(
      (fail) {
        throw Exception(fail.messageAr);
      },
      (banners) {
        _banners = banners;
      },
    );
  }

  Future<void> getSecondBanner() async {
    _services = WebServices();
    _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
    _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
    _getSecondBannerUseCase = GetSecondBannerUseCase(_homeReposatory);
    var response = await _getSecondBannerUseCase.call();
    response.fold(
      (fail) {
        throw Exception(fail.messageAr);
      },
      (banners) {
        _secondBanner = banners;
      },
    );
  }

  Future<void> getAllReviews() async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getAllReviewsUseCase = GetAllReviewsUseCase(_homeReposatory);
      var response = await _getAllReviewsUseCase.call();
      response.fold(
        (error) {
          throw Exception(error.messageAr);
        },
        (data) {
          _reviews = data;
          emit(LoadedReviews(data));
        },
      );
      EasyLoading.dismiss();
    } on DioException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<void> getAllSubCategories(int id) async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      EasyLoading.show();
      var response = await _homeReposatory.getSubCategories(id);
      EasyLoading.dismiss();
      response.fold(
        (error) {
          throw Exception(error.messageAr);
        },
        (data) {
          emit(LoadedSubCategories(data));
        },
      );
      isLoading = false;
    } catch (error) {
      emit(
        ErrorSubCategories(
          error.toString(),
        ),
      );
    }
  }

  Future<void> getAllSpecialProducts() async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getAllSpecialProductsUseCase = GetAllSpecialProducts(_homeReposatory);
      var response = await _getAllSpecialProductsUseCase.call();
      _specialProductsLoading = false;
      log("Called");
      response.fold(
        (error) {
          log("This is Exception ------------------------");

        },
        (data) {
          _specialProducts = data;
        },
      );
    } catch (error) {
      log("error $error}");
      emit(
        ErrorSpecialProducts(
          error.toString(),
        ),
      );
    }
  }
}
