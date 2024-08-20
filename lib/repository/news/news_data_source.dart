import 'package:flutter_app_news_c11_online/model/NewsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
abstract class NewsOfflineDataSource{}