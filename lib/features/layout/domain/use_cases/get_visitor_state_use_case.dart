import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/visitor_status_data_model.dart';

class VisitorStateUseCase {
  HomeReposatory _homeReposatory;

  VisitorStateUseCase(this._homeReposatory);

  Future<Either<Failure, VisitorStatesDataModel>> getVisitorStates() async {
    return await _homeReposatory.getVisitorStates();
  }
}
