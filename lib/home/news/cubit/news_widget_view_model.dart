import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/home/news/cubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidgetViewModel extends Cubit<NewsStates>{
  NewsWidgetViewModel():super(NewsLoadingState());
  //todo: hold data - handle logic
  void getNewsBySourceId(String sourceId)async {
    try {
      emit(MessageState());
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
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