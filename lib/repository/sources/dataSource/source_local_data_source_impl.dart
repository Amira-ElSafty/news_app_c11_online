import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_online/repository/sources/source_data_source.dart';
import 'package:hive/hive.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    var box = await Hive.openBox('tabs');
    var data = SourceResponse.fromJson(box.get(categoryId));
    return data ;
  }

  @override
  void saveSources(SourceResponse? sourceResponse,String category)async {
    var box = await Hive.openBox('tabs');   /// box
    await box.put(category, sourceResponse?.toJson());   /// write data (save)
    await box.close();
  }

}