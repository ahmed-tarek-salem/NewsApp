import 'dart:convert';

import 'package:NewsApp/models/news_model.dart';
import 'package:http/http.dart';

class CategoryNews {
  List<NewsModel> myNews = [];

  Future<void> getNews(String? categoryName) async {
    const apiKey = '123fefbcbc15498999000aa34dc54371';
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=$apiKey');
    Response response = await get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var length = data['articles'].length;

      for (int i = 0; i < length; i++) {
        if (data['articles'][i]['description'] != null &&
            data['articles'][i]['urlToImage'] != null &&
            data['articles'][i]['source']['name'] != null) {
          NewsModel singleItem = NewsModel(
            sourceName: data['articles'][i]['source']['name'],
            content: data['articles'][i]['content'],
            desc: data['articles'][i]['description'],
            urlToImage: data['articles'][i]['urlToImage'],
            url: data['articles'][i]['url'],
            title: data['articles'][i]['title'],
          );
          myNews.add(singleItem);
        }
      }
    }
  }
}
