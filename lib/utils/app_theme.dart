
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    indicatorColor:AppColors.blackColor ,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: AppStyle.medium20Black,
      iconTheme: IconThemeData(color: AppColors.blackColor,),
      centerTitle: true,
    ),

    textTheme: TextTheme(
      labelLarge: AppStyle.bold16Black,
      labelSmall:AppStyle.medium12Gray ,
      labelMedium: AppStyle.medium14Black,
      headlineLarge: AppStyle.medium20Black,
      headlineMedium:  AppStyle.medium24Black,
      headlineSmall: AppStyle.bold24White
    ),
    drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.blackColor,
        scrimColor: AppColors.whiteColor
    ),
    iconTheme: IconThemeData(
        color: AppColors.blackColor
    ),
    dividerTheme: DividerThemeData(
        color: AppColors.blackColor
    ),
    focusColor: AppColors.blackColor,
  );

 static final ThemeData darkTheme = ThemeData(
   primaryColor: AppColors.blackColor,
   indicatorColor:AppColors.whiteColor ,
  scaffoldBackgroundColor: AppColors.blackColor,
   appBarTheme: AppBarTheme(
       backgroundColor: AppColors.blackColor,
       titleTextStyle: AppStyle.medium20white,
     iconTheme: IconThemeData(color: AppColors.whiteColor,),
     centerTitle: true,
   ),
textTheme: TextTheme(
  labelLarge: AppStyle.bold16White,
  labelSmall:AppStyle.medium12Gray ,
  labelMedium: AppStyle.medium14White,
 headlineLarge: AppStyle.medium20white,
  headlineMedium:  AppStyle.medium24White,
    headlineSmall: AppStyle.bold24Black

),
   drawerTheme: DrawerThemeData(
     backgroundColor: AppColors.whiteColor,
     scrimColor: AppColors.whiteColor
   ),

   iconTheme: IconThemeData(
     color: AppColors.whiteColor
   ),
   dividerTheme: DividerThemeData(
       color: AppColors.whiteColor
   ),
   focusColor: AppColors.whiteColor,
 );


}