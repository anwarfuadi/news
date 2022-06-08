class News {
  String title;
  String subTitle;
  String publishedTime;
  String imgPath;

  //TODO: dari json ke object news, untuk baca
  factory News.fromJson(Map<String, dynamic> json) {
    return News(json['title'].toString(), json['subTitle'].toString(),
        json['publishedTime'].toString(), json['imgPath'].toString());
  }

  //TODO: dari object ke json, untuk simpan
  Map<String, dynamic> toJson() => {
        'title': title,
        'subTitle': subTitle,
        'publishedTime': publishedTime,
        'imgPath': imgPath
      };

  News(this.title, this.subTitle, this.publishedTime, this.imgPath);
}
