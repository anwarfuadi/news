import 'package:flutter/material.dart';
import 'widgets/newsform.dart';
import 'widgets/newsfeed.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("News Reader"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                //TODO: Refresh konten newsfeed
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: NewsFeed(),
        //[1] Tombol Add
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewsForm()));
          },
        ),
        //[1]
      ),
    );
  }
}
