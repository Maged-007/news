import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model.dart';

class NewsApi {
  List<NewsModel> dataStore = [];
  Future<void> getNews() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=13f23317f43a459d82f361da2e7d45af');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['title'] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],
            urlToImage: element['urlToImage'] ?? '',
            description: element['description'] ?? 'No description available',
            author: element['author'] ?? 'Unknown author',
            content: element['content'] ?? 'Content not available',
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}

class CategoryNews {
  // for news home screen
  List<NewsModel> dataStore = [];
  Future<void> getNews(String category) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=13f23317f43a459d82f361da2e7d45af");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['title'] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],
            urlToImage: element['urlToImage'] ?? '',
            description: element['description'] ?? 'No description available',
            author: element['author'] ?? 'Unknown author',
            content: element['content'] ?? 'Content not available',
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}
