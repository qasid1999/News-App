import 'package:flutter/material.dart';
import 'package:news_app/Screens/full_detail_news_screen.dart';
import 'package:news_app/listOfFavoriteNews.dart';

class BuildFutureBuilder extends StatefulWidget {
  final Future future;
  final VoidCallback onpressed;
  const BuildFutureBuilder(
      {Key key, @required this.future, @required this.onpressed})
      : super(key: key);

  @override
  _BuildFutureBuilderState createState() => _BuildFutureBuilderState();
}

class _BuildFutureBuilderState extends State<BuildFutureBuilder> {
  List<bool> selected = <bool>[];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
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
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selected[index] =
                                        selected[index] == false ? true : false;
                                    if (selected[index] == true) {
                                      listofNews.add(snapshot.data);
                                    }
                                  });
                                  getData();
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
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selected[index] =
                                  selected[index] == false ? true : false;
                            });
                          },
                          icon: Icon(
                            selected.elementAt(index)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
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
        }
        return Container(
          height: MediaQuery.of(context).size.height - 200,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }

  List<dynamic> listofNews = [];
  List getData() {
    print(listofNews.map((e) => print(e)).toList());
    return listofNews;
  }
}
