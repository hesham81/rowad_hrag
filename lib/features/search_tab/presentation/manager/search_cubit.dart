import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/search_tab/data/data_sources/search_interface_data_source.dart';
import 'package:rowad_hrag/features/search_tab/data/data_sources/search_remote_data_source.dart';
import 'package:rowad_hrag/features/search_tab/data/models/search_request_data_model.dart';
import 'package:rowad_hrag/features/search_tab/data/repositories/search_reposatory_implementation.dart';
import 'package:rowad_hrag/features/search_tab/domain/repositories/search_repo.dart';
import 'package:rowad_hrag/features/search_tab/domain/use_cases/search_use_case.dart';

import '../../../layout/data/models/products_data_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {
    _services = WebServices();
    _interfaceDataSource = SearchRemoteDataSource(_services.freePrimaryDio);
    _reposatory = SearchReposatoryImplementation(_interfaceDataSource);
    _searchUseCase = SearchUseCase(_reposatory);
  }

  late final WebServices _services;
  late final SearchInterfaceDataSource _interfaceDataSource;
  late final SearchReposatory _reposatory;
  late final SearchUseCase _searchUseCase;

  Future<void> search(SearchRequestDataModel searchParameters) async {
    emit(SearchLoading());
    try {
      final response = await _searchUseCase(searchParameters);
      response.fold(
            (l) => emit(SearchError(message: l.messageAr ?? l.messageEn ?? "Error")),
            (r) => emit(SuccessSearch(products: r)),
      );
    } catch (error) {
      emit(SearchError(message: error.toString()));
    }
  }
}
