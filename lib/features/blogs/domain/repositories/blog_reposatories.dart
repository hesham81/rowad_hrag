import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';

import '../../data/models/blog_data_model.dart';

abstract class BlogReposatories {
  Future<Either<Failure, List<BlogDataModel>>> getAllBlogs();
}
