import 'dart:convert';
import 'dart:developer';

import 'package:news_app_flutter_course/models/news_model.dart';

import 'package:http/http.dart' as http;

import '../consts/api_consts.dart';

class NewsAPiServices {
  static Future<List<NewsModel>> getAllNews(
      {required int page, required String sortby}) async {
    //
    // var url = Uri.parse(
    //     'https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=');
    try {
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": "sports",
        "pageSize": "5",
        "sortBy": sortby,

        "page": page.toString(),
        // "domains": "techcrunch.com"

        // "apiKEY": API_KEY
      });
      var response = await http.get(
        uri,
        headers: {"X-Api-key": API_KEY},
      );
      // print('Response status: ${response.statusCode}');
      log('Response statusCode : ${response.statusCode}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw data['message'];
      }
      for (var v in data["articles"]) {
        newsTempList.add(v);
        // log(v.toString());
        // print(data["articles"].length.toString());
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<NewsModel>> getTopTred() async {
    //
    // var url = Uri.parse(
    //     'https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=');
    try {
      var uri = Uri.https(BASEURL, "v2/top-headlines", {
        
         "country":"us"
         
        // "domains": "techcrunch.com"

        // "apiKEY": API_KEY
      });
      var response = await http.get(
        uri,
        headers: {"X-Api-key": API_KEY},
      );
      // print('Response status: ${response.statusCode}');
      log('Response statusCode : ${response.statusCode}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw data['message'];
      }
      for (var v in data["articles"]) {
        newsTempList.add(v);
        // log(v.toString());
        // print(data["articles"].length.toString());
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (e) {
      throw e.toString();
    }
  }
}
