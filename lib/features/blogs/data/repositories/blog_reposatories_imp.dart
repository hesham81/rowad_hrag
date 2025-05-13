import 'package:dartz/dartz.dart';

import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/blogs/data/data_sources/blog_interface_data_source.dart';

import '../../../../core/failures/server_failure.dart';
import '../../domain/repositories/blog_reposatories.dart';
import '../models/blog_data_model.dart';

class BlogReposatoriesImp implements BlogReposatories {
  BlogInterfaceDataSource _interfaceDataSource;

  BlogReposatoriesImp(this._interfaceDataSource);

  @override
  Future<Either<Failure, List<BlogDataModel>>> getAllBlogs() async {
    try {
      var response = await _interfaceDataSource.getBlogs();
      if (response.statusCode == 200 && response.data["success"]) {
        final List<dynamic> jsonData = response.data["data"];

        return Right(
          jsonData.map((e) => BlogDataModel.fromJson(e)).toList(),
        );
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.toString(),
          message: "Something Went Wrong",
        ),
      );
    }
  }
}
