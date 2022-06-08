import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  //const NewsPage({ Key? key }) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    //TODO: baca dari API : details.php

    return Scaffold(
      appBar: AppBar(
        title: Text("Sport"),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'images/1.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title'),
                Row(
                  children: [
                    Expanded(
                      child: Text('Published Time'),
                    ),
                    Icon(Icons.comment),
                    Text('9'),
                  ],
                ),
                Text(
                    'News Content News Content News Content News Content News Content News Content News Content '),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
