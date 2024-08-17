import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';

abstract class SourceStates{}    /// parent
class SourceInitialState extends SourceStates{}
class SourceLoadingState extends SourceStates {}
class SourceErrorState extends SourceStates{
  String errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourceStates{
  List<Source> sourcesList ;
  SourceSuccessState({required this.sourcesList});
}
