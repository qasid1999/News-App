import 'package:flutter/material.dart';
import 'package:news_app/Screens/favorite_news_screen.dart';
import 'package:news_app/Screens/headlines_api.dart';
import 'package:news_app/Screens/popular_stories_api.dart';
import 'package:news_app/Screens/search_screen.dart';
import 'package:news_app/Screens/sport_news_api.dart';
import 'package:news_app/Screens/top_stories_api.dart';

import 'full_detail_news_screen.dart';

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
  ApiServiceForHeadlines headlinewsApi = ApiServiceForHeadlines();
  ApiServiceForPopularNews popularNewsApi = ApiServiceForPopularNews();
  ApiServiceSportsNews sportsNewsApi = ApiServiceSportsNews();
  ApiServiceForTopStories topStoriesApi = ApiServiceForTopStories();

  int selectedindex = 0;
  List<bool> selected = <bool>[];
  List selectedNews = [];
  buildfutureBuilder(Future future) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final stories = snapshot.data;

          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              selected.add(false);
              if (stories[index].image != null) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 5,
                    bottom: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FullDetailNewsScreen(
                              source: stories[index].source,
                              title: stories[index].title,
                              description: stories[index].description,
                              image: stories[index].image,
                              publishedAt: stories[index].publishedAt,
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  stories[index].image ?? "",
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selected[index] =
                                        selected[index] == false ? true : false;
                                  });
                                  if (selected[index] == true) {
                                    selectedNews.add(stories[index]);
                                  } else {
                                    selectedNews.remove(stories[index]);
                                  }
                                },
                                icon: Icon(
                                  selected.elementAt(index)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8,
                                bottom: 10,
                              ),
                              child: Text(
                                stories[index].title ?? "",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                                left: 8.0,
                                right: 8,
                                bottom: 10,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    stories[index].publishedAt,
                                  ),
                                  const Spacer(),
                                  Text(
                                    stories[index].source.name,
                                    style: const TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 5,
                    bottom: 16,
                  ),
                  child: Card(
                    elevation: 20,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 150,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "No Image",
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selected[index] =
                                      selected[index] == false ? true : false;
                                });
                                if (selected[index] == true) {
                                  selectedNews.add(stories[index]);
                                } else {
                                  selectedNews.remove(stories[index]);
                                }
                              },
                              icon: Icon(
                                selected.elementAt(index)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8,
                              bottom: 10,
                            ),
                            child: Text(
                              stories[index].title ?? "",
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8.0,
                              right: 8,
                              bottom: 10,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  stories[index].publishedAt,
                                ),
                                const Spacer(),
                                Text(
                                  stories[index].source.name,
                                  style: const TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        } else if (snapshot.hasError) {
          return const Text("There is an Error Occured");
        }
        return Container(
          height: MediaQuery.of(context).size.height - 200,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF1D1E45)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "KP News App",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              trailing: Icon(
                Icons.arrow_forward,
              ),
            ),
            const ListTile(
              title: Text('Setting'),
              leading: Icon(
                Icons.settings,
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
            ),
            const ListTile(
              title: Text('Logout'),
              leading: Icon(
                Icons.logout,
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
            ),
            const ListTile(
              title: Text('About us'),
              leading: Icon(Icons.person),
              trailing: Icon(
                Icons.arrow_forward,
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
                                    return FavoriteNewsScreen(
                                      favoritenewsData: selectedNews,
                                    );
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
                  return buildfutureBuilder(topStoriesApi.getArticle());
                } else if (listofnews[selectedindex] == "Headlines") {
                  return buildfutureBuilder(headlinewsApi.getArticle());
                } else if (listofnews[selectedindex] == "Popular Stories") {
                  return buildfutureBuilder(popularNewsApi.getArticle());
                }
                return buildfutureBuilder(sportsNewsApi.getArticle());
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
