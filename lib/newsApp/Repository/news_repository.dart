import 'package:login_api_project/newsApp/Repository/news_client.dart';
import 'package:login_api_project/newsApp/models/news_response_model.dart';

class NewsRepository {
  NewsRepository._();
  static final NewsRepository newsRepository = NewsRepository._();
  Future<List<Articles>> convertNewsToModel(String title) async {
    try {
      Map map = await NewsClient.newsClient.getAllNews(title);
      NewsModel newsModel = NewsModel.fromJson(map);
      List<Articles> articles = newsModel.articles;

      return articles;
    } catch (error) {
      print(error);
    }
  }
}
