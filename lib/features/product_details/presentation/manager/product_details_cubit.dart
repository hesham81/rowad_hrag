import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/bot_toast.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/product_interface_data_source.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/remote_product_data_source.dart';
import 'package:rowad_hrag/features/product_details/data/repositories/product_details_repositories_imp.dart';
import 'package:rowad_hrag/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:rowad_hrag/features/product_details/domain/use_cases/get_city_by_state_use_case.dart';
import 'package:rowad_hrag/features/product_details/domain/use_cases/get_states_use_case.dart';
import 'package:rowad_hrag/features/product_details/domain/use_cases/pay_to_product_details_use_case.dart';
import 'package:rowad_hrag/features/product_details/domain/use_cases/send_message_between_seller_and_customer_use_case.dart';
import '../../../auth/data/models/city_data_model.dart';
import '../../../auth/data/models/states_data_model.dart';
import '../../data/models/message_request_data_model.dart';
import '../../data/models/product_details_data_model.dart';
import '../../domain/use_cases/get_product_details_use_case.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  late ProductDetailsRepo _productDetailsRepo;

  late GetProductDetailsUseCase _getProductDetailsUseCase;

  late WebServices _services;

  late ProductInterfaceDataSource _interfaceDataSource;

  CityDataModel? _cityDataModel;

  CityDataModel? _statesDataModel;

  CityDataModel? get cityDataModel => _cityDataModel;

  CityDataModel? get statesDataModel => _statesDataModel;

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
            ProductDetailsError(error.messageAr ??
                error.messageEn ??
                "حدث خطأ ما برجاء\nبرجاء المحاوله مره اخري"),
          );
        },
        (data) async {
          _productDetailsDataModel = data;
          await _getStates(data.stateId);
          emit(ProductDetailsLoaded(productDetailsDataModel!));
        },
      );
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  late GetStatesUseCase _getStatesUseCase;

  Future<bool> _getStates(int id) async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteProductDataSource(_services.freePrimaryDio);
      _productDetailsRepo = ProdcutDetailsRepositoriesImp(_interfaceDataSource);

      _getStatesUseCase = GetStatesUseCase(_productDetailsRepo);
      var response = await _getStatesUseCase.getState(
        id,
      );
      response.fold(
        (error) {
          emit(
            ProductDetailsError(error.messageAr ??
                error.messageEn ??
                "حدث خطأ ما برجاء\nبرجاء المحاوله مره اخري"),
          );
        },
        (data) {
          _statesDataModel = data;
          _getCity(data.id, productDetailsDataModel?.stateId ?? 4001);
        },
      );
      return true;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  late GetCityByStateUseCase _getCityByStateUseCase;

  StatesDataModel? _cityData;

  StatesDataModel? get cityData => _cityData;

  Future<void> _getCity(int id, int productStateId) async {
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteProductDataSource(_services.freePrimaryDio);
      _productDetailsRepo = ProdcutDetailsRepositoriesImp(_interfaceDataSource);
      _getCityByStateUseCase = GetCityByStateUseCase(_productDetailsRepo);
      var response = await _getCityByStateUseCase.call(id);
      response.fold(
        (error) {
          emit(
            ProductDetailsError(error.messageAr ??
                error.messageEn ??
                "حدث خطأ ما برجاء\nبرجاء المحاوله مره اخري"),
          );
        },
        (data) {
          StatesDataModel city = data
              .where(
                (element) => element.id == productStateId,
              )
              .first;
          if (city == null) {
            throw Exception("حدث خطاء برجاء المحاوله مره اخري");
          }
          _cityData = city;
        },
      );
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  late PayToProductDetailsUseCase _payToProductDetailsUseCase;

  String? url;

  Future<void> pay() async {
    EasyLoading.show();
    try {
      _services = WebServices();
      _interfaceDataSource = RemoteProductDataSource(_services.tokenDio);
      _productDetailsRepo = ProdcutDetailsRepositoriesImp(_interfaceDataSource);
      _payToProductDetailsUseCase =
          PayToProductDetailsUseCase(_productDetailsRepo);

      var response = await _payToProductDetailsUseCase
          .call(productDetailsDataModel!.unitPrice);
      response.fold(
        (error) {
          emit(
            ProductDetailsError(error.messageAr ??
                error.messageEn ??
                "حدث خطاء برجاء المحاوله مره اخري"),
          );
        },
        (data) {
          url = data;
        },
      );
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  late SendMessageBetweenSellerAndCustomerUseCase
      _sendMessageBetweenSellerAndCustomerUseCase;

  Future<void> sendMessage(MessageRequestDataModel message) async {
    try {
      EasyLoading.show();
      _services = WebServices();
      _interfaceDataSource = RemoteProductDataSource(_services.tokenDio);
      _productDetailsRepo = ProdcutDetailsRepositoriesImp(_interfaceDataSource);
      _sendMessageBetweenSellerAndCustomerUseCase =
          SendMessageBetweenSellerAndCustomerUseCase(_productDetailsRepo);
      var response = await _sendMessageBetweenSellerAndCustomerUseCase.call(
        message,
      );
      response.fold(
        (error) {
          BotToastServices.showErrorMessage(
            error.messageAr ??
                error.messageEn ??
                "حدث خطاء برجاء المحاوله مره اخري",
          );
        },
        (data) {
          BotToastServices.showSuccessMessage("Message Sent Successfully");
        },
      );
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
