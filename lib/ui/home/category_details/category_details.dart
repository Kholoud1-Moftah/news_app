import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category_details/source/source_tab_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          // todo: loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }
          // todo: error => client
          else if(snapshot.hasError){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context)!.something_went_wrong,
                style: Theme.of(context).textTheme.labelMedium,),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });
                },
                    child: Text(AppLocalizations.of(context)!.try_again,
                  style: Theme.of(context).textTheme.labelMedium,),
                  style:ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyColor
                  ) ,),
              ],
            );
          }
          // todo: server => response => success,error
          // todo: server => error
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!,
                  style: Theme.of(context).textTheme.labelMedium,),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });
                },
          child: Text(AppLocalizations.of(context)!.try_again,
          style: Theme.of(context).textTheme.labelMedium,),
          style:ElevatedButton.styleFrom(
          backgroundColor: AppColors.greyColor
          ) ,),


              ],
            );
          }
          // todo: server => success
          var sourcesList = snapshot.data?.sources ??[];
          return SourceTabWidget(sourcesList: sourcesList);

        },
    );
  }
}
