import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/models/news_model.dart';
import 'package:news_app_flutter_course/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];
  List<NewsModel> get getNewsList {
    return newsList;
  }

  Future<List<NewsModel>> fetchAllNews(
      {required int pageIndex, required String sort}) async {
    newsList = await NewsAPiServices.getAllNews(page: pageIndex, sortby: sort);
    return newsList;
  }

  NewsModel findByDate({required String publishedAt}) {
    return newsList.firstWhere((element) => element.publishedAt == publishedAt);
  }
  Future<List<NewsModel>> fetchTopTrend(
    ) async {
    newsList = await NewsAPiServices.getTopTred();
    return newsList;
  }
}
