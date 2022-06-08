import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../env.dart';

class NewsForm extends StatefulWidget {
  //const NewsForm({ Key? key }) : super(key: key);

  @override
  _NewsFormState createState() => _NewsFormState();
}

class _NewsFormState extends State<NewsForm> {
  //id unik untuk form
  final _formKey = GlobalKey<FormState>();

  //controller
  final ctrlTitle = TextEditingController();
  final ctrlSubTitle = TextEditingController();
  final ctrlNews = TextEditingController();
  final ctrlImage = TextEditingController();

  @override
  void dispose() {
    ctrlTitle.dispose();
    ctrlSubTitle.dispose();
    ctrlNews.dispose();
    ctrlImage.dispose();
    super.dispose();
  }

  Future _createNews() async {
    return await http.post(
      Uri.parse(Env.server + '/api/create.php'),
      body: {
        "title": ctrlTitle.text,
        "subTitle": ctrlSubTitle.text,
        "news": ctrlNews.text,
        "imgPath": ctrlImage.text,
      },
    );
  }

  void _saveNews(context) async {
    final response = await _createNews();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      //TODO : Masukkan form ke widget yang bisa scrolling
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TextFormField(
                controller: ctrlTitle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TextFormField(
                controller: ctrlSubTitle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Sub Title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TextFormField(
                controller: ctrlNews,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'News',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TextFormField(
                controller: ctrlImage,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Image',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) _saveNews(context);
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
