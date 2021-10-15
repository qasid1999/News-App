import 'package:flutter/material.dart';

import 'full_detail_news_screen.dart';

class FavoriteNewsScreen extends StatefulWidget {
  final List favoritenewsData;
  const FavoriteNewsScreen({Key key, @required this.favoritenewsData})
      : super(key: key);

  @override
  _FavoriteNewsScreenState createState() => _FavoriteNewsScreenState();
}

class _FavoriteNewsScreenState extends State<FavoriteNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1E35),
        title: const Text("Favorite News"),
      ),
      body: Center(
        child: Center(
          child: widget.favoritenewsData.isEmpty
              ? const Text("There is no Favorite News")
              : ListView.builder(
                  itemCount: widget.favoritenewsData.length,
                  itemBuilder: (context, index) {
                    if (widget.favoritenewsData[index].image != null) {
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
                                    source:
                                        widget.favoritenewsData[index].source,
                                    title: widget.favoritenewsData[index].title,
                                    description: widget
                                        .favoritenewsData[index].description,
                                    image: widget.favoritenewsData[index].image,
                                    publishedAt: widget
                                        .favoritenewsData[index].publishedAt,
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
                                        widget.favoritenewsData[index].image ??
                                            "",
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      widget.favoritenewsData[index].title ??
                                          "",
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
                                          widget.favoritenewsData[index]
                                              .publishedAt,
                                        ),
                                        const Spacer(),
                                        Text(
                                          widget.favoritenewsData[index].source
                                              .name,
                                          style: const TextStyle(
                                              color: Colors.red),
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
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8,
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    widget.favoritenewsData[index].title ?? "",
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
                                        widget.favoritenewsData[index]
                                            .publishedAt,
                                      ),
                                      const Spacer(),
                                      Text(
                                        widget.favoritenewsData[index].source
                                            .name,
                                        style:
                                            const TextStyle(color: Colors.red),
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
                  }),
        ),
      ),
    );
  }
}
