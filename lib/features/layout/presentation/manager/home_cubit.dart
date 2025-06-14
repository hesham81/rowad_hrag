import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/top_sellers_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/visitor_status_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_all_special_products.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_people_with_special_needs_products_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_second_banner.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_special_products_needs_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_top_sellers_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_visitor_state_use_case.dart';
import '../../data/models/sub_categories_data_model.dart';
import '../../domain/use_cases/get_all_sub_categories_use_case.dart';
import '/core/route/route_names.dart';
import '/features/layout/data/models/category_data_model.dart';
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
      getSecondBanner(),
      getPeopleWithSpecialNeedsProducts(),
      getProductiveFamiliesProducts(),
      getVisitorState(),
      getTopSellers(),
    ]);
  }

  TextEditingController reviewController = TextEditingController();

  bool isLoading = true;
  List<ProductsDataModel> _specialProducts = [];
  List<ProductsDataModel> _productiveFamiliesProducts = [];

  int _rate = 0;

  int get rate => _rate;

  void setRate(int rate) {
    _rate = rate;
    emit(
      UpdateRate(
        rate: rate,
      ),
    );
  }

  List<ProductsDataModel> get productiveFamiliesProducts =>
      _productiveFamiliesProducts;

  late GetAllCategoriesUseCase _getAllCategoriesUseCase;
  late HomeInterfaceDataSource _interfaceDataSource;
  late HomeReposatory _homeReposatory;
  late WebServices _services;
  late GetAllBannersUseCase _getAllBannersUseCase;
  late GetAllReviewsUseCase _getAllReviewsUseCase;
  late GetAllSpecialProducts _getAllSpecialProductsUseCase;
  late GetSecondBannerUseCase _getSecondBannerUseCase;
  late GetPeopleWithSpecialNeedsUseCase _getPeopleWithSpecialNeedsUseCase;
  late GetAllSubCategoriesUseCase _getAllSubCategoriesUseCase;
  late getProductiveFamiliesProductsUseCase
      _getProductiveFamiliesProductsUseCase;

  List<SubCategoriesDataModel> _subCategories = [];

  List<SubCategoriesDataModel> get subCategories => _subCategories;

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

  List<ProductsDataModel> _peopleWithSpecialNeed = [];

  List<TopSellersDataModel> _topSellers = [];

  List<TopSellersDataModel> get topSellers => _topSellers;

  List<ProductsDataModel> get peopleWithSpecialNeed => _peopleWithSpecialNeed;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    emit(HomeInitial());
  }

  VisitorStatesDataModel? _visitorStatesDataModel;

  VisitorStatesDataModel? get visitorStatesDataModel => _visitorStatesDataModel;

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
          throw Exception(
            "${error.messageAr} ${error.messageEn}",
          );
        },
        (list) {
          list = list
              .where(
                (element) =>
                    element.icon !=
                    "https://rowad-harag.com/public/assets/img/placeholder.jpg",
              )
              .toList();
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
      _getAllSubCategoriesUseCase = GetAllSubCategoriesUseCase(_homeReposatory);
      EasyLoading.show();
      var response = await _homeReposatory.getSubCategories(id);
      EasyLoading.dismiss();
      response.fold(
        (error) {
          throw Exception(error.messageAr);
        },
        (data) {
          _subCategories = data;
        },
      );
    } catch (error) {
      emit(
        ErrorSubCategories(
          error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
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

  Future<void> getPeopleWithSpecialNeedsProducts() async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getPeopleWithSpecialNeedsUseCase =
          GetPeopleWithSpecialNeedsUseCase(_homeReposatory);
      var response = await _getPeopleWithSpecialNeedsUseCase.call();
      _specialProductsLoading = false;
      log("Called");
      response.fold(
        (error) {
          log("This is Exception ------------------------");
        },
        (data) {
          _peopleWithSpecialNeed = data;
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

  Future<void> getProductiveFamiliesProducts() async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getProductiveFamiliesProductsUseCase =
          getProductiveFamiliesProductsUseCase(_homeReposatory);
      var response = await _getProductiveFamiliesProductsUseCase.call();
      _specialProductsLoading = false;
      log("Called");
      response.fold(
        (error) {
          log("This is Exception ------------------------");
        },
        (data) {
          _productiveFamiliesProducts = data;
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

  late VisitorStateUseCase _visitorStateUseCase;

  Future<void> getVisitorState() async {
    _services = WebServices();
    _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
    _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
    _visitorStateUseCase = VisitorStateUseCase(_homeReposatory);
    try {
      var response = await _visitorStateUseCase.getVisitorStates();
      response.fold(
        (error) {
          throw Exception(error.messageAr);
        },
        (data) {
          _visitorStatesDataModel = data;
        },
      );
    } catch (error) {
      log("Error On GetVisitorState $error");
    }
  }

  late GetTopSellersUseCase _getTopSellersUseCase;

  Future<void> getTopSellers() async {
    _services = WebServices();
    _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
    _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
    _getTopSellersUseCase = GetTopSellersUseCase(_homeReposatory);
    try {
      var response = await _getTopSellersUseCase.call();
      response.fold(
        (error) {
          throw Exception(error.messageAr);
        },
        (data) {
          _topSellers = data;
        },
      );
    } catch (error) {
      log("Error On GetTopSellers $error");
    }
  }
}
