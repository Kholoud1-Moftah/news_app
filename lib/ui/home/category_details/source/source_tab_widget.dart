import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category_details/news/news_widget.dart';
import 'package:news_app/ui/home/category_details/source/source_name.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';

class SourceTabWidget extends StatefulWidget {
  List<Sources> sourcesList ;

  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },
              tabAlignment: TabAlignment.start,
              dividerColor: AppColors.transparentColor,
              indicatorColor: Theme.of(context).indicatorColor,
              isScrollable: true,
                tabs: widget.sourcesList.map((source) {
                  return SourceName(source:source ,
                    isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                  );
                }).toList()),
            SizedBox(height: height*0.02,),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex])),
          ],
        ),
    );
  }
}
