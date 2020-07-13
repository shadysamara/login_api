import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsClient {
  NewsClient._();
  static final NewsClient newsClient = NewsClient._();
  http.Client client;
  http.Client initClient() {
    if (client == null) {
      client = http.Client();
      return client;
    } else {
      return client;
    }
  }

  Future<Map> getAllNews(String title) async {
    try {
      client = initClient();
      http.Response response = await client.get(
          'https://newsapi.org/v2/everything?q=$title&apiKey=450df5e3a4cf4982a1b94a3f70d43193');
      Map map = json.decode(response.body) as Map;

      return map;
    } catch (error) {
      print(error);
    }
  }
}
