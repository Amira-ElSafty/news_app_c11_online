import 'package:flutter_app_news_c11_online/model/NewsResponse.dart';

abstract class NewsStates{} // parent
class NewsLoadingState extends NewsStates{}
class NewsErrorState extends NewsStates{
  String errorMessage ;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsStates {
  List<News> newsList ;
  NewsSuccessState({required this.newsList});
}
class MessageState extends NewsStates{}