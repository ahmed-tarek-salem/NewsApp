import 'package:NewsApp/shared/components/const.dart';

class NewsModel {
  String? sourceName;
  String? title;
  String? desc;
  String? url;
  String? urlToImage;
  String? content;

  NewsModel({
    this.sourceName,
    this.title,
    this.desc,
    this.url,
    this.urlToImage,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
      content: map[columnContent],
      desc: map[columnDesc],
      sourceName: map[columnSourceName],
      title: map[columnTitle],
      url: map[columnUrl],
      urlToImage: map[columnUrlToImage],
    );
  }
  toJson() {
    return {
      columnSourceName: sourceName,
      columnContent: content,
      columnDesc: desc,
      columnTitle: title,
      columnUrl: url,
      columnUrlToImage: urlToImage,
      columnId: url,
    };
  }
}
