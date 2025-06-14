import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/plans/data/data_sources/plans_interface_data_source.dart';
import 'package:rowad_hrag/features/plans/data/data_sources/remote_plans_data_source.dart';
import 'package:rowad_hrag/features/plans/data/repositories/plans_repo_implementation.dart';
import 'package:rowad_hrag/features/plans/domain/repositories/plans_reposatory.dart';
import 'package:rowad_hrag/features/plans/domain/use_cases/get_all_plans_use_case.dart';

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
      _dataSource = RemotePlansDataSource(_dio.freePrimaryDio);
      _plansReposatory = PlansRepoImplementation(_dataSource);
      _getAllPlansUseCase = GetAllPlansUseCase(_plansReposatory);
      var response = await _getAllPlansUseCase.call();
      response.fold(
        (error) {
          emit(
            PlansErrorState(
              error.messageAr ?? error.messageEn ?? "حدث خطاء ما برجاء\nبرجاء المحاوله مره اخري",
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
    }
    finally {
      EasyLoading.dismiss();
    }
  }
}
