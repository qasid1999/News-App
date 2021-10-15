import 'package:flutter/material.dart';

class FavoriteNewsScreen extends StatefulWidget {
  const FavoriteNewsScreen({Key key}) : super(key: key);

  @override
  _FavoriteNewsScreenState createState() => _FavoriteNewsScreenState();
}

class _FavoriteNewsScreenState extends State<FavoriteNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 70),
            color: Colors.grey[300],
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Favorite News",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
