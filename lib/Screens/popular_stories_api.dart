import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/CommonClasses/data.dart';

class ApiServiceForPopularNews {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Data>> getArticle() async {
    final queryParameters = {
      'domains': 'wsj.com',
      'apiKey': 'fb1c33f1879c42558f650e863bddfc59'
    };
    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> body = json['articles'];
    List<Data> articles =
        body.map((dynamic item) => Data.fromJson(item)).toList();
    return articles;
  }
}
