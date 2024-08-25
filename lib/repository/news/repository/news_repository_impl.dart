import 'package:flutter_app_news_c11_online/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_online/repository/news/news_data_source.dart';
import 'package:flutter_app_news_c11_online/repository/news/news_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource ;
  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }

}