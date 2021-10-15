import 'package:flutter/material.dart';

class SourceData {
  String id;
  String name;
  SourceData({
    @required this.id,
    @required this.name,
  });
  factory SourceData.fromJson(Map<String, dynamic> json) {
    return SourceData(
      id: json['id'],
      name: json['name'],
    );
  }
}
