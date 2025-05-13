import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/blogs/data/data_sources/blog_interface_data_source.dart';
import 'package:rowad_hrag/features/blogs/data/data_sources/remote_blog_data_source.dart';
import 'package:rowad_hrag/features/blogs/domain/use_cases/get_all_blogs_use_case.dart';
import 'package:rowad_hrag/features/layout/presentation/manager/home_cubit.dart';

import '../../data/repositories/blog_reposatories_imp.dart';
import '../../domain/entities/blog.dart';
import '../../domain/repositories/blog_reposatories.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());
  late GetAllBlogsUseCase _allBlogsUseCase;
  late BlogReposatories _blogReposatories;
  late BlogInterfaceDataSource _interfaceDataSource;
  late WebServices _dio;

  Future<void> getBlogs() async {
    _dio = WebServices();
    _interfaceDataSource = RemoteBlogDataSource(_dio.freePrimaryDio);
    _blogReposatories = BlogReposatoriesImp(_interfaceDataSource);
    _allBlogsUseCase = GetAllBlogsUseCase(_blogReposatories);
    try {
      EasyLoading.show();

      var response = await _allBlogsUseCase.call();
      EasyLoading.dismiss();
      response.fold(
        (fail) {
          emit(
            BlogError(
              fail.messageAr ?? "",
            ),
          );
        },
        (blogs) {
          emit(
            BlogLoaded(
              blogs,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        BlogError(
          error.toString(),
        ),
      );
    }
  }
}
