import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/news/data/models/article_model.dart';

class NewsRemoteDatasource {
  Future<List<ArticleModel>> fetchAllPosts() async {
    var client = http.Client();
    try {
      //we use https to help provide query parameters required with this newsapi
      //when you hover on https, you will see an example of how it is done
      final url = Uri.https(newsApiBaseUrl, endpoint, {
        'country': countryQuery,
        'category': category,
        'apiKey': newsApiKey,
      });
      final response = await client.get(url).timeout(Duration(seconds: 60));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final List<ArticleModel> articles = (data['articles'] as List)
            .where(
              (json) => json['title'] != null && json['urlToImage'] != null,
            )
            .map((json) => ArticleModel.fromJson(json))
            .toList();
        return articles;
      } else {
        print('Error: status code : ${response.statusCode}');
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      client.close();
    }
  }
}
