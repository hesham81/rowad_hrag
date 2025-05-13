import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/adds/presentation/pages/adds_page.dart';
import '/features/bills/presentation/pages/upload_bills_page.dart';
import '/features/blogs/presentation/pages/blogs.dart';
import '/features/layout/domain/entities/banner.dart';
import '/features/layout/presentation/pages/home_page.dart';
import '/features/profile/presentation/pages/profile.dart';
import '/core/services/web_services.dart';
import '/features/layout/data/data_sources/remote_home_data_source.dart';
import '/features/layout/data/repositories/home_reposatories_implementation.dart';
import '/features/layout/domain/use_cases/get_all_categories.dart';
import '../../data/data_sources/home_interface_data_source.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/home_reposatory.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  late GetAllCategoriesUseCase _getAllCategoriesUseCase;
  late HomeInterfaceDataSource _interfaceDataSource;
  late HomeReposatory _homeReposatory;
  late WebServices _services;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    emit(HomeInitial());
  }

  var pages = [
    HomePage(),
    Blogs(),
    Blogs(),
    UploadBillsPage(),
    AddsPage(),
    Blogs(),
    Blogs(),
    Profile(),
    Blogs(),
  ];

  Future<bool> getAllCategories() async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getAllCategoriesUseCase = GetAllCategoriesUseCase(_homeReposatory);
      var response = await _getAllCategoriesUseCase.call();
      return response.fold(
        (error) {
          return false;
        },
        (list) {
          emit(
            HomeLoaded(list),
          );
          return true;
        },
      );
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<bool> getAllBanners() async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteHomeDataSource(_services.freePrimaryDio);
      _homeReposatory = HomeReposatoriesImplementation(_interfaceDataSource);
      _getAllCategoriesUseCase = GetAllCategoriesUseCase(_homeReposatory);
      var response = await _homeReposatory.getAllBanners();
      response.fold(
        (error) {
          emit(
            ErrorBanners(error.messageAr ?? ""),
          );
        },
        (banners) {
          emit(LoadedBanners(banners));
        },
      );
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
}
