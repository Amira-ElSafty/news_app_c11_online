import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_online/api/api_manager.dart';
import 'package:flutter_app_news_c11_online/app_colors.dart';
import 'package:flutter_app_news_c11_online/home/tabs/tab_widget.dart';
import 'package:flutter_app_news_c11_online/model/Category.dart';
import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  Category category ;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ));
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          /// server (response) => success , error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          /// success
          var sourceList = snapshot.data!.sources! ;
          return TabWidget(sourcesList: sourceList,);
        }
    );
  }
}
