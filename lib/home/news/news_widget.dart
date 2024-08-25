import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_online/app_colors.dart';
import 'package:flutter_app_news_c11_online/di/di.dart';
import 'package:flutter_app_news_c11_online/di/di_impl.dart';
import 'package:flutter_app_news_c11_online/home/news/cubit/news_states.dart';
import 'package:flutter_app_news_c11_online/home/news/cubit/news_widget_view_model.dart';
import 'package:flutter_app_news_c11_online/home/news/news_item.dart';
import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = getIt<NewsWidgetViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??"");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsWidgetViewModel, NewsStates>(
      bloc: viewModel,
        builder: (context, state) {
      if (state is NewsLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryLightColor,
          ),
        );
      } else if (state is NewsErrorState) {
        return Column(
          children: [
            Text(state.errorMessage),
            ElevatedButton(
                onPressed: () {
                  viewModel.getNewsBySourceId(widget.source.id ?? '');
                },
                child: Text('Try again'))
          ],
        );
      } else if (state is NewsSuccessState) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: state.newsList[index]);
          },
          itemCount: state.newsList.length,
        );
      }
      return Container();
    });
    //   FutureBuilder<NewsResponse?>(
    //     future: ApiManager.getNewsBySourceId(widget.source.id??""),
    //     builder: (context,snapshot){
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.primaryLightColor,
    //           ),
    //         );
    //       }else if(snapshot.hasError){
    //         return Column(
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(onPressed: (){
    //               ApiManager.getNewsBySourceId(widget.source.id??'');
    //               setState(() {
    //
    //               });
    //             }, child: Text('Try again'))
    //           ],
    //         );
    //       }
    //       // server => success , error
    //       if(snapshot.data!.status != 'ok'){
    //         return Column(
    //           children: [
    //             Text(snapshot.data!.message!),
    //             ElevatedButton(onPressed: (){
    //               ApiManager.getNewsBySourceId(widget.source.id??'');
    //               setState(() {
    //
    //               });
    //             }, child: Text('Try again'))
    //           ],
    //         );
    //       }
    //       var newsList = snapshot.data!.articles! ;
    //       return ListView.builder(itemBuilder: (context,index){
    //         return NewsItem(news: newsList[index]);
    //       },
    //       itemCount: newsList.length,);
    //     }
    // );
  }
}
