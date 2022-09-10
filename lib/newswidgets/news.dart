import 'articleModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class News {


  List<ArticleModel> news = [];

 Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=6e2752043ac84694879d6fb76da56683';

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null && element["content"] != null) {
          ArticleModel articleModel = new ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            );
          news.add(articleModel);
}
      }
      );
    }
 }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

 Future<void> getNews(String category) async {
    String url =
       
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&category=business&apiKey=6e2752043ac84694879d6fb76da56683';

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null && element["content"] != null) {
          ArticleModel articleModel = new ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            );
          news.add(articleModel);
}
      }
      );
    }
 }
}