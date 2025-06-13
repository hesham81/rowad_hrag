import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/product_interface_data_source.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/remote_product_data_source.dart';
import 'package:rowad_hrag/features/product_details/data/repositories/product_details_repositories_imp.dart';
import 'package:rowad_hrag/features/product_details/domain/repositories/product_details_repo.dart';
import '../../data/models/product_details_data_model.dart';
import '../../domain/use_cases/get_product_details_use_case.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  late ProductDetailsRepo _productDetailsRepo;

  late GetProductDetailsUseCase _getProductDetailsUseCase;

  late WebServices _services;

  late ProductInterfaceDataSource _interfaceDataSource;

  ProductDetailsDataModel? _productDetailsDataModel;

  ProductDetailsDataModel? get productDetailsDataModel =>
      _productDetailsDataModel;

  Future<void> getProductDetails(String id) async {
    _services = WebServices();
    _interfaceDataSource = RemoteProductDataSource(_services.freePrimaryDio);
    _productDetailsRepo = ProdcutDetailsRepositoriesImp(_interfaceDataSource);
    _getProductDetailsUseCase = GetProductDetailsUseCase(_productDetailsRepo);
    try {
      EasyLoading.show();
      var response = await _getProductDetailsUseCase.call(id);
      // EasyLoading.dismiss();
      response.fold(
        (error) {
          emit(
            ProductDetailsError(error.messageAr ?? ""),
          );
        },
        (data) {
          _productDetailsDataModel = data;
          emit(ProductDetailsLoaded(productDetailsDataModel!));
        },
      );
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      log(productDetailsDataModel?.name.toString() ?? "");
      EasyLoading.dismiss();
    }
  }
}
