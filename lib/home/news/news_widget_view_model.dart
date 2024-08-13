import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier{
  // hold data - handle logic
  List<News>? newsList ;
  String? errorMessage ;
  void getNewsBySourceId(String sourceId)async{
    newsList = null ;
    errorMessage = null ;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response?.status == 'error'){
        errorMessage = response!.message ;
      }else{
        newsList = response!.articles;
      }
    }catch(e){
      errorMessage = 'Error Loading News List.';
    }
    notifyListeners();
  }
}