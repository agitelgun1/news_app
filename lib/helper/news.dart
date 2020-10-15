import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=8ed8780c2eb64051b49884582b2ad350";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["content"]);

          news.add(articleModel);
        }
      });
    }
  }
}

class CategorieNews {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=8ed8780c2eb64051b49884582b2ad350";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["content"]);
              
          news.add(articleModel);
        }
      });
    }
  }
}
