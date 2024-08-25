// //todo: viewModel => object Repository
// //todo: repository => object dataSource
// //todo: dataSource => apiManager
//
// import 'package:flutter_app_news_c11_online/api/api_manager.dart';
// import 'package:flutter_app_news_c11_online/repository/news/dataSource/news_remote_data_source_impl.dart';
// import 'package:flutter_app_news_c11_online/repository/news/news_data_source.dart';
// import 'package:flutter_app_news_c11_online/repository/news/news_repository.dart';
// import 'package:flutter_app_news_c11_online/repository/news/repository/news_repository_impl.dart';
// import 'package:flutter_app_news_c11_online/repository/sources/dataSource/source_local_data_source_impl.dart';
// import 'package:flutter_app_news_c11_online/repository/sources/dataSource/source_remote_data_source_impl.dart';
// import 'package:flutter_app_news_c11_online/repository/sources/repository/source_repository_impl.dart';
// import 'package:flutter_app_news_c11_online/repository/sources/source_data_source.dart';
// import 'package:flutter_app_news_c11_online/repository/sources/source_repository_contract.dart';
//
// SourceRepositoryContract injectSourceRepository(){
//   return SourceRepositoryImpl(
//       remoteDataSource: injectSourceRemoteDataSource(),
//       localDataSource: injectSourceLocalDataSource());
// }
// SourceRemoteDataSource injectSourceRemoteDataSource(){
//   return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
// SourceLocalDataSource injectSourceLocalDataSource(){
//   return SourceLocalDataSourceImpl();
// }
//
// NewsRepository injectNewsRepository(){
//   return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
// }
// NewsRemoteDataSource injectNewsRemoteDataSource(){
//   return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
