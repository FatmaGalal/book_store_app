import 'package:book_store/src/features/home/data/data_sources/api_service.dart';
import 'package:book_store/src/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_store/src/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_store/src/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepoProvider = Provider((ref) {
  return HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteDataSourceImpl(
      apiService: ApiService(dio: Dio()),
    ),
    homeLocalDataSource: HomeLocalDataSourceImpl(), 
  );
});