import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_online/home/home_screen.dart';
import 'package:flutter_app_news_c11_online/my_bloc_observer.dart';
import 'package:flutter_app_news_c11_online/my_theme_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
    );
  }
}
