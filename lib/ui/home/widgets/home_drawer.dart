import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/ui/home/widgets/drawer_item.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../tabs/language/language_bottom_sheet.dart';
import '../tabs/theme/theme_bottom_sheet.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Drawer(
      child: Container(
        color: AppColors.blackColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:AppColors.whiteColor ,
              ),
              child: Center(
                child:  Text(AppLocalizations.of(context)!.news_app,
                  style:AppStyle.bold24Black )
              ),
            ),
            ListTile(
              leading: ImageIcon(AssetImage(AppAssets.homeIcon),
              color:AppColors.whiteColor ,),
              title:  Text(AppLocalizations.of(context)!.go_to_home,
                style:AppStyle.bold20White,),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: height*0.02,),
            Divider(
              color: AppColors.whiteColor,
              endIndent: width*0.04,
              indent: width*0.04,
              height: 2,
            ),
            SizedBox(height: height*0.02,),
            DrawerItem(icon: AppAssets.themeIcon, title: AppLocalizations.of(context)!.theme),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.02,
                  horizontal: width*0.04),
              padding: EdgeInsets.symmetric(horizontal: width * 0.02,
                  vertical: height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color:AppColors.whiteColor,
                    width: 2),
              ),
              child: InkWell(
                onTap: () {
                  showThemeBottomSheet(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(themeProvider.appTheme == ThemeMode.dark?
                    AppLocalizations.of(context)!.dark:
                    AppLocalizations.of(context)!.light,
                      style:AppStyle.medium20white ),
                    Icon(Icons.arrow_drop_down_outlined,
                      size: 35,color:AppColors.whiteColor,),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Divider(
              color: AppColors.whiteColor,
              endIndent: width*0.04,
              indent: width*0.04,
              height: 2,
            ),
            SizedBox(height: height*0.02,),
            DrawerItem(icon: AppAssets.languageIcon, title: AppLocalizations.of(context)!.language),
            Container(
              margin: EdgeInsets.only(top: height * 0.02,
                  right: width*0.04,
              left: width*0.04),
              padding: EdgeInsets.symmetric(horizontal: width * 0.02,
                  vertical: height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.whiteColor ,
                    width: 2),
              ),
              child: InkWell(
                onTap: () {
                  showLanguageBottomSheet(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(languageProvider.appLanguage == 'en'?
                    AppLocalizations.of(context)!.english:
                    AppLocalizations.of(context)!.arabic,
                      style: AppStyle.medium20white),
                    Icon(Icons.arrow_drop_down_outlined,
                      size: 35,color:AppColors.whiteColor,),
                  ],
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
  void showLanguageBottomSheet(BuildContext context){
    showModalBottomSheet(context: context,
      builder: (context) => LanguageBottomSheet(),);

  }
  void showThemeBottomSheet(BuildContext context){
    showModalBottomSheet(context: context,
      builder: (context) => ThemeBottomSheet(),);

  }
}
