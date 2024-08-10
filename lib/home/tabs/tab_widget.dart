import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_online/home/news/news_widget.dart';
import 'package:flutter_app_news_c11_online/home/tabs/tab_item.dart';
import 'package:flutter_app_news_c11_online/model/SourceResponse.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabWidget({required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList
                    .map((source) => TabItem(
                        source: source,
                        isSelected: selectedIndex ==
                            widget.sourcesList.indexOf(source)))
                    .toList()),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
