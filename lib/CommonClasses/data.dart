import 'package:flutter/cupertino.dart';
import 'package:news_app/CommonClasses/source_data.dart';

class Data {
  SourceData source;
  String title;
  String description;
  String image;
  String publishedAt;

  Data({
    @required this.source,
    @required this.title,
    @required this.description,
    @required this.image,
    // ignore: non_constant_identifier_names
    @required this.publishedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      source: SourceData.fromJson(json['source']),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
    );
  }
}
