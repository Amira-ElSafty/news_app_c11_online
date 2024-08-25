import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/home/news/cubit/news_states.dart';
import 'package:flutter_app_news_c11_online/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:flutter_app_news_c11_online/repository/news/news_data_source.dart';
import 'package:flutter_app_news_c11_online/repository/news/news_repository.dart';
import 'package:flutter_app_news_c11_online/repository/news/repository/news_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsWidgetViewModel extends Cubit<NewsStates>{
   NewsRepository newsRepository ;
  NewsWidgetViewModel({required this.newsRepository}):super(NewsLoadingState());
  //todo: hold data - handle logic
  void getNewsBySourceId(String sourceId)async {

    try {
      emit(MessageState());
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if(response?.status == 'error'){
        emit(NewsErrorState(errorMessage: response!.message!));
        return ;
      }
      if(response?.status == 'ok'){
        emit(NewsSuccessState(newsList: response!.articles!));
        return ;
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}