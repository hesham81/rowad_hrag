import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/plans/data/data_sources/plans_interface_data_source.dart';
import 'package:rowad_hrag/features/plans/data/data_sources/remote_plans_data_source.dart';
import 'package:rowad_hrag/features/plans/data/models/pay_to_plan_data_model.dart';
import 'package:rowad_hrag/features/plans/data/repositories/plans_repo_implementation.dart';
import 'package:rowad_hrag/features/plans/domain/repositories/plans_reposatory.dart';
import 'package:rowad_hrag/features/plans/domain/use_cases/get_all_plans_use_case.dart';
import 'package:rowad_hrag/features/plans/domain/use_cases/pay_custom_payment_with_1_percent_use_case.dart';
import 'package:rowad_hrag/features/plans/domain/use_cases/pay_to_plan_use_case.dart';

import '../../data/models/plans_data_model.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansInitialState> {
  PlansCubit() : super(PlansInitialState());

  late GetAllPlansUseCase _getAllPlansUseCase;
  late PlansReposatory _plansReposatory;

  late PlansInterfaceDataSource _dataSource;

  late WebServices _dio;

  Future<void> getAllPlans() async {
    try {
      EasyLoading.show();
      _dio = WebServices();
      _dataSource = RemotePlansDataSource(_dio.tokenDio);
      _plansReposatory = PlansRepoImplementation(_dataSource);
      _getAllPlansUseCase = GetAllPlansUseCase(_plansReposatory);
      var response = await _getAllPlansUseCase.call();
      response.fold(
            (error) {
          emit(
            PlansErrorState(
              error.messageAr ??
                  error.messageEn ??
                  "حدث خطاء ما برجاء\nبرجاء المحاوله مره اخري",
            ),
          );
        },
            (data) {
          emit(
            PlansLoadedState(
              data,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        PlansErrorState(
          error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  late final PayToPlanUseCase _payToPlanUseCase;

  Future<void> payToPlan(int index) async {
    try {
      EasyLoading.show();
      _dio = WebServices();
      _dataSource = RemotePlansDataSource(_dio.tokenDio);
      _plansReposatory = PlansRepoImplementation(_dataSource);
      _payToPlanUseCase = PayToPlanUseCase(_plansReposatory);
      final payment = PayToPlanDataModel(planId: index);

      var response = await _payToPlanUseCase.call(payment);

      response.fold(
            (error) {
          emit(
            PaymentErrorState(
              error.messageAr ??
                  error.messageEn ??
                  "حدث خطاء ما برجاء\nبرجاء المحاوله مره اخري",
            ),
          );
        },
            (data) async {
          await UrlLauncherFunc.openUrl(data);
        },
      );
    } catch (error) {
      emit(
        PaymentErrorState(
          error.toString(),
        ),
      );
    }
    finally {
      EasyLoading.dismiss();
    }
  }

  late PayCustomPaymentWith1PercentUseCase _customPaymentWith1PercentUseCase;


  Future<void> payCustomAmount(double amount) async {
    try {
      EasyLoading.show();
      _dio = WebServices();
      _dataSource = RemotePlansDataSource(_dio.tokenDio);
      _plansReposatory = PlansRepoImplementation(_dataSource);
      _customPaymentWith1PercentUseCase =
          PayCustomPaymentWith1PercentUseCase(_plansReposatory);
      var response = await _customPaymentWith1PercentUseCase.call(amount);
      response.fold(
            (error) {
          emit(
            PaymentErrorState(
              error.messageAr ?? error.messageEn ??
                  "حدث خطاء ما برجاء\nبرجاء المحاوله مره اخري",
            ),
          );
        },
            (data) async {
          await UrlLauncherFunc.openUrl(data);
        },
      );
    } catch (error) {
      emit(
        PaymentErrorState(
          error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
