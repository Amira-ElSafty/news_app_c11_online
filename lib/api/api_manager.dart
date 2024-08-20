import 'dart:convert';
import 'package:flutter_app_news_c11_online/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_online/api/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiManager {
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
 */
  Future<SourceResponse?> getSources(String categoryId) async{
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {'apiKey': ApiConstants.apiKey,
        'category' : categoryId
        });
   var response = await http.get(url);
   try{
     var responseBody = response.body ;    /// String
     var json = jsonDecode(responseBody);   /// json
     return SourceResponse.fromJson(json);    /// SourceResponse
   }catch(e){
     throw e ;
   }

   // SourceResponse.fromJson(jsonDecode(response.body));
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
   Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
     'apiKey' : ApiConstants.apiKey,
     'sources' : sourceId
   });
   var response = await http.get(url);
   try{
     var responseBody = response.body ; /// String
     var json = jsonDecode(responseBody) ;   /// json
     return NewsResponse.fromJson(json);
   }catch(e){
     throw e ;
   }

 }
}
