import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category_details/news/news_item.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_colors.dart';

class NewsWidget extends StatelessWidget {
  Sources source;
  NewsWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(source.id ?? ''),
      builder: (context, snapshot) {
        // todo: loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        }
        // todo: error => client
        else if (snapshot.hasError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.something_went_wrong,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(source.id ?? '');
                },
                child: Text(
                  AppLocalizations.of(context)!.try_again,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
              ),
            ],
          );
        }
        // todo: server => response => success,error
        // todo: server => error
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(source.id ?? '');
                },
                child: Text(
                  AppLocalizations.of(context)!.try_again,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
              ),
            ],
          );
        }
        // todo: server => success
        var newsList = snapshot.data?.articles ?? [];
        return ListView.separated(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: height*0.02,);
          },
        );
      },
    );
  }
}
