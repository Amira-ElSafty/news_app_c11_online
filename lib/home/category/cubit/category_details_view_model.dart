import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/home/category/cubit/sources_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates>{
  CategoryDetailsViewModel(): super(SourceLoadingState());
  // todo: hold data - handle logic
  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if(response?.status == 'error'){
        emit(SourceErrorState(errorMessage: response!.message!));
        return ;
      }
      if(response?.status == 'ok'){
        emit(SourceSuccessState(sourcesList: response!.sources!));
        return ;
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}