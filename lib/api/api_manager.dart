import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
class ApiManager{

  static Future<SourceResponse> getSources()async{
   Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.sourceApi,{
   'apiKey' : ApiConstants.apiKey
   });
   try{
     var response =await  http.get(url);
     var responseBody = response.body; // todo : string
     // todo: string => json
     var json = jsonDecode(responseBody); // todo: json
     //todo: json => object
     //SourceResponse.fromJson(jsonDecode(response.body));
     return SourceResponse.fromJson(json);

   }catch(e){
     throw e;
   }

  }
/*https://newsapi.org/v2/everything?q=bitcoin&apiKey=9c14cf369cf94822bbe81cb87c31b52d*/

  static Future<NewsResponse>  getNewsBySourceId(String sourceId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,
      EndPoints.newsApi,{
      'apiKey' : ApiConstants.apiKey,
        'sources'  : sourceId
        }
    );
    try{
  var response =await http.get(url) ;
  var responseBody=  response.body;
  var json = jsonDecode(responseBody);
  return NewsResponse.fromJson(json);
    }catch(e){
     throw e;
    }
  }
}