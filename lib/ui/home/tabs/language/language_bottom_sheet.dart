
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_language_provider.dart';
import '../../../../utils/app_colors.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start  ,
        children: [
          InkWell(
            onTap: () {
             languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLanguage == 'en' ?
                getSelectedLanguageItems(
                    textLanguage: AppLocalizations.of(context)!.english):
                getUnSelectedLanguageItems(
                    textLanguage:AppLocalizations.of(context)!.english )
          ),
          SizedBox(height: 14,),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
            },
            child:languageProvider.appLanguage == 'ar' ?
            getSelectedLanguageItems(
                textLanguage: AppLocalizations.of(context)!.arabic):
            getUnSelectedLanguageItems(
                textLanguage:AppLocalizations.of(context)!.arabic )
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguageItems({required String textLanguage}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textLanguage,
          style: AppStyle.medium20Black,),
        Icon(Icons.check,size: 35,color: AppColors.blackColor,)
      ],
    );
  }
  Widget getUnSelectedLanguageItems({required String textLanguage}){
    return Text(textLanguage,
      style: AppStyle.medium20Black,);

  }
}
