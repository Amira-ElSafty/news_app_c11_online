import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_online/repository/news/news_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager ;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId)async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response ;
  }

}