import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier{
  String appLanguage = 'en';
  AppLanguageProvider() {
    loadLanguage();
  }
 Future <void> changeLanguage (String newLanguage)async{
if(appLanguage == newLanguage){
  return;
}
appLanguage = newLanguage;
notifyListeners();
final prefs = await SharedPreferences.getInstance();
await prefs.setString('language', newLanguage);
  }
  void loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('language');

    if (savedLanguage != null) {
      appLanguage = savedLanguage;
      notifyListeners();
    }
  }

}