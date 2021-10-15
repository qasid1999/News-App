import 'package:flutter/material.dart';
import 'package:news_app/CommonClasses/future_builder.dart';
import 'package:news_app/Screens/favorite_news_screen.dart';
import 'package:news_app/Screens/headlines_screen.dart';
import 'package:news_app/Screens/popular_stories_screen.dart';
import 'package:news_app/Screens/search_screen.dart';
import 'package:news_app/Screens/sport_news_screen.dart';
import 'package:news_app/Screens/top_stories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listofnews = [
    "Top Stories",
    "Headlines",
    "Popular Stories",
    "Sport News",
    "Favorite News",
  ];

  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF1D1E45)),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Muhammad Qasid",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "qasidqasid809@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 20,
            title: const Text(
              "KP News",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SearchScreen();
                    }));
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ],
            centerTitle: true,
            backgroundColor: const Color(0xFF1D1E35),
            expandedHeight: 110.0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                padding: const EdgeInsets.only(left: 2),
                height: 45,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: listofnews.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide.none,
                          right: BorderSide.none,
                          top: BorderSide.none,
                          bottom: BorderSide(
                            color: selectedindex == index
                                ? Colors.red
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedindex = index;
                            if (listofnews[selectedindex] == "Favorite News") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return FavoriteNewsScreen();
                                  },
                                ),
                              );
                              selectedindex = 0;
                            }
                          });
                        },
                        child: Text(
                          listofnews[index],
                          style: TextStyle(
                            fontSize: selectedindex == index ? 18 : 14,
                            color: selectedindex == index
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (listofnews[selectedindex] == "Top Stories") {
                  return const TopStoriesScreen();
                } else if (listofnews[selectedindex] == "Headlines") {
                  return const HeadlinesScreen();
                } else if (listofnews[selectedindex] == "Popular Stories") {
                  return const PopularStoriesScreen();
                }
                return const SportNewsScreen();
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
