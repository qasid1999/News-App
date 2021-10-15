import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1E35),
        title: const Text("Search your Favorite News"),
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search News",
          ),
        ),
      ),
    );
  }
}
