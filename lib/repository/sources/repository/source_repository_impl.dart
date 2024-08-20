import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_online/repository/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_data_source.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSource remoteDataSource ;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }

}