import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_data_source.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_repository_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SourceRepositoryContract)
class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource ;
  SourceRepositoryImpl({required this.remoteDataSource,required this.localDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.wifi ||
    connectivityResult == ConnectivityResult.mobile){
      //todo: internet => remote data source
      var sourceResponse =  await remoteDataSource.getSources(categoryId);
      localDataSource.saveSources(sourceResponse,categoryId);
      return sourceResponse ;
    }else{
      // todo: no internet connection => local data source
      var response = await localDataSource.getSources(categoryId);
      return response ;
    }
  }
}
