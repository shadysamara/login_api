import 'package:flutter/material.dart';
import 'package:login_api_project/newsApp/Repository/news_repository.dart';
import 'package:login_api_project/newsApp/models/news_response_model.dart';

class NewsProvider extends ChangeNotifier {
  List<Articles> articles = [];
  getAllArticles(String title) async {
    try {
      List<Articles> articles =
          await NewsRepository.newsRepository.convertNewsToModel(title);
      this.articles = articles;

      notifyListeners();
    } catch (error) {
      print(error);
    }
    // return articles;
  }
}
