import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager ;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    var response = await apiManager.getSources(categoryId);
    return response ;
  }

}