import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/auth_services.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/top_sellers_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/visitor_status_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/entities/add_rate_request.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/add_new_rate_on_home_layout_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_all_products_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_all_special_products.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_people_with_special_needs_products_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_second_banner.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_special_products_needs_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_top_sellers_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_visitor_state_use_case.dart';
import '../../data/models/banner_data_model.dart';
import '../../data/models/reviews_data_model.dart';
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
      getAllProducts(),
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

  List<ReviewsDataModel> _reviews = [];

  List<BannerDataModel> _banners = [];
  List<BannerDataModel> _secondBanner = [];

  List<BannerDataModel> get secondBanner => _secondBanner;

  List<Category> _categories = [];
  bool _specialProductsLoading = true;

  bool get specialProductsLoading => _specialProductsLoading;

  List<Category> get categories => _categories;

  List<ProductsDataModel> get specialProducts => _specialProducts;

  List<BannerDataModel> get banners => _banners;

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
    // RouteNames.bills,
    RouteNames.addAdds,
    RouteNames.plans,
    RouteNames.contactWithSupport,
    RouteNames.profile,
  ];

  List<CategoryDataModel> _categoriesData = [];

  List<CategoryDataModel> get categoriesData => _categoriesData;

  Future<void> getAllCategories() async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getAllCategoriesUseCase = GetAllCategoriesUseCase(_homeReposatory);
      var response = await _getAllCategoriesUseCase.call();
      response.fold(
        (error) {
          // throw Exception(
          //   "${error.messageAr} ${error.messageEn}",
          // );
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} on Get All Categories",
            ),
          );
        },
        (list) async {
          _categoriesData = list;
          await getAllBanners();
        },
      );
    } catch (error) {
      emit(
        HomeError(
          error.toString(),
        ),
      );
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
        emit(
          HomeError(
            "${fail.messageAr ?? fail.messageEn ?? "Error"} On Get All Banners",
          ),
        );
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
        emit(
          HomeError(
            "${fail.messageAr ?? fail.messageEn ?? "Error"} On Get Second Banner",
          ),
        );
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
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get All Reviews",
            ),
          );
        },
        (data) {
          _reviews = data;
        },
      );
    } on DioException catch (error) {
      emit(
        HomeError(
          "${error.response?.data["message"]} On Get All Reviews",
        ),
      );
    }
  }

  Future<void> getAllSubCategories(int id) async {
    try {
      EasyLoading.show();
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getAllSubCategoriesUseCase = GetAllSubCategoriesUseCase(_homeReposatory);
      var response = await _homeReposatory.getSubCategories(id);
      response.fold(
        (error) {
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get All Sub Categories",
            ),
          );
        },
        (data) {
          _subCategories = data;
        },
      );
    } catch (error) {
      emit(
        ErrorSubCategories(
          "${error.toString()} on Get All Sub Categories",
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
      response.fold(
        (error) {
          emit(
            ErrorSpecialProducts(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get All Special Products",
            ),
          );
        },
        (data) {
          _specialProducts = data;
        },
      );
    } catch (error) {
      emit(
        ErrorSpecialProducts(
          "${error.toString()} On Get All Special Products",
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
      response.fold(
        (error) {
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get All People With Special Needs",
            ),
          );
        },
        (data) {
          _peopleWithSpecialNeed = data;
        },
      );
    } catch (error) {
      emit(
        HomeError(
          "${error.toString()} On Get All People With Special Needs",
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
      response.fold(
        (error) {
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get Productive Families Products",
            ),
          );
        },
        (data) {
          _productiveFamiliesProducts = data;
        },
      );
    } catch (error) {
      emit(
        HomeError(
          "${error.toString()} On Get Productive Families Products",
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
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get Visitor States",
            ),
          );
        },
        (data) {
          _visitorStatesDataModel = data;
        },
      );
    } catch (error) {
      emit(
        HomeError(
          "${error.toString()} On Get Visitor States",
        ),
      );
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
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get Top Sellers",
            ),
          );
        },
        (data) {
          _topSellers = data;
        },
      );
    } catch (error) {
      emit(
        HomeError(
          "${error.toString()} On Get Top Sellers",
        ),
      );
    }
  }

  late final AddNewRateOnHomeLayoutUseCase _addNewRateOnHomeLayoutUseCase;

  bool _isRateSubmited = false;

  bool get isRateSubmited => _isRateSubmited;

  Future<void> addNewReview(AddRateRequest rate) async {
    _services = WebServices();
    _interfaceDataSource = RemoteHomeDataSource(_services.tokenDio);
    _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
    _addNewRateOnHomeLayoutUseCase =
        AddNewRateOnHomeLayoutUseCase(_homeReposatory);
    try {
      var response = await _addNewRateOnHomeLayoutUseCase.call(rate);
      response.fold(
        (error) {
          emit(
            HomeError(
              error.messageAr ?? error.messageEn ?? "Error",
            ),
          );
        },
        (data) {
          _isRateSubmited = true;
        },
      );
    } catch (error) {
      log("Error On GetTopSellers $error");
    } finally {}
  }

  static Future<void> logOut() async {
    await AuthServices.signOut();
  }

  late final GetAllProductsUseCase _getAllProductsUseCase;

  List<ProductsDataModel> _allProducts = [];

  List<ProductsDataModel> get allProducts => _allProducts;

  Future<void> getAllProducts() async {
    _services = WebServices();
    _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
    _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
    _getAllProductsUseCase = GetAllProductsUseCase(_homeReposatory);
    try {
      var response = await _getAllProductsUseCase.call();
      response.fold(
        (error) {
          emit(
            HomeError(
              "${error.messageAr ?? error.messageEn ?? "Error"} On Get All Products",
            ),
          );
        },
        (data) {
          _allProducts = data;
          emit(
            LoadedHomeScreen(
              categories: _categoriesData,
              banner: _banners,
              secondBanner: _secondBanner,
              specialProducts: _specialProducts,
              productiveFamiliesProducts: _productiveFamiliesProducts,
              specialNeedsProducts: _peopleWithSpecialNeed,
              allProducts: _allProducts,
              reviews: _reviews,
              visitorStatesDataModel: _visitorStatesDataModel!,
              topSellers: _topSellers,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        HomeError(
          "${error.toString()} On Get All Products",
        ),
      );
    }
  }
}
