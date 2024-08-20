import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';

abstract class SourceRepositoryContract{
  Future<SourceResponse?> getSources(String categoryId);
}
