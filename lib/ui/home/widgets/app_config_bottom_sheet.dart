import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_style.dart';
import '../tabs/language/language_bottom_sheet.dart';
import '../tabs/theme/theme_bottom_sheet.dart';

class AppConfigBottomSheet extends StatelessWidget {
  const AppConfigBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
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
