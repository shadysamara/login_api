import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login_api_project/newsApp/Repository/news_client.dart';
import 'package:login_api_project/newsApp/Repository/news_repository.dart';
import 'package:login_api_project/newsApp/models/news_response_model.dart';
import 'package:login_api_project/newsApp/providers/news_provider.dart';
import 'package:provider/provider.dart';

class NewsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('News Home'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              Provider.of<NewsProvider>(context, listen: false)
                  .getAllArticles(value);
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          Expanded(child: Consumer<NewsProvider>(
            builder: (context, value, child) {
              List<Articles> articles = value.articles;
              if (articles == null) {
                return Container();
              } else if (articles.isEmpty) {
                return Center(
                  child: Text('No News Found'),
                );
              } else {
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            articles[index].urlToImage),
                      ),
                      title: Text(articles[index].title),
                      trailing: IconButton(
                          icon: Icon(Icons.favorite), onPressed: () {}),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
