import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/home/category/cubit/sources_states.dart';
import 'package:flutter_app_news_c11_online/repository/sources/dataSource/source_local_data_source_impl.dart';
import 'package:flutter_app_news_c11_online/repository/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_app_news_c11_online/repository/sources/repository/source_repository_impl.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_data_source.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_repository_contract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates>{
  late SourceRepositoryContract repositoryContract ;
  late SourceRemoteDataSource remoteDataSource ;
  late ApiManager apiManager ;
  late SourceLocalDataSource localDataSource ;
  CategoryDetailsViewModel(): super(SourceLoadingState()){
    apiManager = ApiManager();
    remoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
    localDataSource = SourceLocalDataSourceImpl();
    repositoryContract = SourceRepositoryImpl(
        remoteDataSource: remoteDataSource,
    localDataSource: localDataSource);
  }
  // todo: hold data - handle logic
  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await repositoryContract.getSources(categoryId);
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