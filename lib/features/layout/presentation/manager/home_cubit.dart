import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_all_products_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_all_special_products.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_people_with_special_needs_products_use_case.dart';
import 'package:rowad_hrag/features/layout/domain/use_cases/get_all_categories.dart';
import '../../data/data_sources/home_interface_data_source.dart';
import '../../data/models/sub_categories_data_model.dart';
import '../../domain/use_cases/get_all_sub_categories_use_case.dart';
import '../../domain/use_cases/get_special_products_needs_use_case.dart';
import '/features/layout/data/data_sources/remote_home_data_source.dart';
import '/features/layout/data/repositories/home_reposatories_implementation.dart';
import '/core/services/web_services.dart';
import '/features/layout/domain/repositories/home_reposatory.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    _initHome();
  }

  // Dependencies
  late final WebServices _services;
  late final HomeInterfaceDataSource _dataSource;
  late final HomeReposatory _repo;
  late final GetAllCategoriesUseCase _getAllCategories;
  late final GetAllSpecialProducts _getSpecialProducts;
  late final GetPeopleWithSpecialNeedsUseCase _getSpecialNeeds;
  late final getProductiveFamiliesProductsUseCase _getFamilies;
  late final GetAllProductsUseCase _getAllProducts;
  late GetAllSubCategoriesUseCase _getAllSubCategoriesUseCase;


  // Local state
  List<CategoryDataModel> _categories = [];
  List<ProductsDataModel> _specialProducts = [];
  List<ProductsDataModel> _familiesProducts = [];
  List<ProductsDataModel> _specialNeedsProducts = [];
  List<ProductsDataModel> _allProducts = [];

  // Getters
  List<CategoryDataModel> get categories => _categories;

  List<ProductsDataModel> get specialProducts => _specialProducts;

  List<ProductsDataModel> get productiveFamiliesProducts => _familiesProducts;

  List<ProductsDataModel> get specialNeedsProducts => _specialNeedsProducts;

  List<ProductsDataModel> get allProducts => _allProducts;

  Future<void> _getSubCategorise(int id)async{
    _services = WebServices();
    _dataSource = RemoteHomeDataSource(_services.freePrimaryDio);
    _repo = HomeReposatoriesImplementation(_dataSource);
    _getAllCategories = GetAllCategoriesUseCase(_repo);
    _getSpecialProducts = GetAllSpecialProducts(_repo);
    _getSpecialNeeds = GetPeopleWithSpecialNeedsUseCase(_repo);
    _getFamilies = getProductiveFamiliesProductsUseCase(_repo);
    _getAllProducts = GetAllProductsUseCase(_repo);
    _getAllSubCategoriesUseCase = GetAllSubCategoriesUseCase(_repo);

    await getAllSubCategories(id);
  }


  Future<void> _initHome( ) async {
    _services = WebServices();
    _dataSource = RemoteHomeDataSource(_services.freePrimaryDio);
    _repo = HomeReposatoriesImplementation(_dataSource);
    _getAllCategories = GetAllCategoriesUseCase(_repo);
    _getSpecialProducts = GetAllSpecialProducts(_repo);
    _getSpecialNeeds = GetPeopleWithSpecialNeedsUseCase(_repo);
    _getFamilies = getProductiveFamiliesProductsUseCase(_repo);
    _getAllProducts = GetAllProductsUseCase(_repo);
    _getAllSubCategoriesUseCase = GetAllSubCategoriesUseCase(_repo);

    // 1. Load from Hive first (cache)
    // await _loadCachedData();

    // 2. Load fresh from API
    await _fetchAndCacheFreshData();
  }
  List<SubCategoriesDataModel> _subCategories = [];

  List<SubCategoriesDataModel> get subCategories => _subCategories;

  Future<void> getAllSubCategories(int id) async {
    try {
      EasyLoading.show();
      var response = await _repo.getSubCategories(id);
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
        HomeError(
          error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  List<T> safeHiveList<T>(
    dynamic raw,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (raw == null) return [];

    // If stored incorrectly as a Map instead of List
    if (raw is Map) {
      return [fromJson(Map<String, dynamic>.from(raw))];
    }

    // If stored correctly as List<Map<String, dynamic>>
    if (raw is List) {
      return raw.map((e) {
        try {
          return fromJson(Map<String, dynamic>.from(e));
        } catch (_) {
          return fromJson({});
        }
      }).toList();
    }

    return [];
  }

  Future<void> _loadCachedData() async {
    final categoriesBox = await Hive.openBox("categoriesData");
    final specialBox = await Hive.openBox("specialProducts");
    final familiesBox = await Hive.openBox("familiesProducts");
    final needsBox = await Hive.openBox("specialNeedsProducts");
    final allBox = await Hive.openBox("allProducts");

    _categories = safeHiveList(
      categoriesBox.get("categoriesData"),
      (json) => CategoryDataModel.fromJson(json),
    );

    _specialProducts = safeHiveList(
      specialBox.get("specialProducts"),
      (json) => ProductsDataModel.fromJson(json),
    );

    _familiesProducts = safeHiveList(
      familiesBox.get("familiesProducts"),
      (json) => ProductsDataModel.fromJson(json),
    );

    _specialNeedsProducts = safeHiveList(
      needsBox.get("specialNeedsProducts"),
      (json) => ProductsDataModel.fromJson(json),
    );

    _allProducts = safeHiveList(
      allBox.get("allProducts"),
      (json) => ProductsDataModel.fromJson(json),
    );

    if (_allProducts.isNotEmpty) {
      emit(
        LoadedHomeScreen(
          categories: _categories,
          specialProducts: _specialProducts,
          productiveFamiliesProducts: _familiesProducts,
          specialNeedsProducts: _specialNeedsProducts,
          allProducts: _allProducts,
        ),
      );
    }
  }

  Future<void> _fetchAndCacheFreshData() async {
    try {
      final catResult = await _getAllCategories.call();
      catResult.fold((e) {}, (data) async {
        _categories = data;
        final box = await Hive.openBox("categoriesData");
        await box.put("categoriesData", data.map((e) => e.toJson()).toList());
      });

      final specialResult = await _getSpecialProducts.call();
      specialResult.fold((e) {}, (data) async {
        _specialProducts = data;
        final box = await Hive.openBox("specialProducts");
        await box.put("specialProducts", data.map((e) => e.toJson()).toList());
      });

      final familiesResult = await _getFamilies.call();
      familiesResult.fold((e) {}, (data) async {
        _familiesProducts = data;
        final box = await Hive.openBox("familiesProducts");
        await box.put("familiesProducts", data.map((e) => e.toJson()).toList());
      });

      final needsResult = await _getSpecialNeeds.call();
      needsResult.fold((e) {}, (data) async {
        _specialNeedsProducts = data;
        final box = await Hive.openBox("specialNeedsProducts");
        await box.put(
            "specialNeedsProducts", data.map((e) => e.toJson()).toList());
      });

      final allResult = await _getAllProducts.call();
      allResult.fold(
        (e) => emit(HomeError(e.messageAr ?? e.messageEn ?? "Error")),
        (data) async {
          _allProducts = data;
          final box = await Hive.openBox("allProducts");
          await box.put("allProducts", data.map((e) => e.toJson()).toList());

          emit(
            LoadedHomeScreen(
              categories: _categories,
              specialProducts: _specialProducts,
              productiveFamiliesProducts: _familiesProducts,
              specialNeedsProducts: _specialNeedsProducts,
              allProducts: _allProducts,
            ),
          );
        },
      );
    } catch (e) {
      emit(HomeError("Failed to fetch data: $e"));
    }
  }
}
