import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/ui/home/category_fragment/category_fragment.dart';
import 'package:news_app/ui/home/widgets/app_bar_custom.dart';
import 'package:news_app/ui/home/widgets/home_drawer.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor ,
      appBar: AppBarCustom(title: AppLocalizations.of(context)!.home),
      drawer: HomeDrawer(),
      body: CategoryFragment(),
    );
  }
}

