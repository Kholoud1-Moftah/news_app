import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_style.dart';

class DrawerItem extends StatelessWidget {
  String icon;
  String title;
   DrawerItem({super.key,
   required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.03),
      child: Row(
        children: [
          ImageIcon(AssetImage(icon,),
            size: 40,
            color:AppColors.whiteColor ,),
          SizedBox(width: width*0.01,),
          Text(title,
              style:AppStyle.bold20White),
        ],
      ),
    );
  }
}
