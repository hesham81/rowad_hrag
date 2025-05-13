import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/blogs/domain/repositories/blog_reposatories.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/blog_data_model.dart';

class GetAllBlogsUseCase {
  BlogReposatories _blogReposatories;

  GetAllBlogsUseCase(this._blogReposatories);

  Future<Either<Failure, List<BlogDataModel>>> call() async {
    return await _blogReposatories.getAllBlogs();
  }
}
