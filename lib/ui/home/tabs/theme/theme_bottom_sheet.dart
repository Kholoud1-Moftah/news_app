
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_theme.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppThemeProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start  ,
        children: [
          InkWell(
            onTap: () {
             themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme == ThemeMode.dark ?
                getSelectedThemeItems(
                    textTheme: AppLocalizations.of(context)!.dark):
                getUnSelectedThemeItems(
                    textTheme:AppLocalizations.of(context)!.dark )
          ),
          SizedBox(height: 14,),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child:themeProvider.appTheme == ThemeMode.light ?
            getSelectedThemeItems(
                textTheme: AppLocalizations.of(context)!.light):
            getUnSelectedThemeItems (
                textTheme:AppLocalizations.of(context)!.light )
          ),
        ],
      ),
    );
  }

  Widget getSelectedThemeItems({required String textTheme}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textTheme,
          style: AppStyle.medium20Black,),
        Icon(Icons.check,size: 35,color: AppColors.blackColor,)
      ],
    );
  }
  Widget getUnSelectedThemeItems({required String textTheme}){
    return Text(textTheme,
      style: AppStyle.medium20Black,);

  }
}
