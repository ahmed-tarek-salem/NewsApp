import 'package:NewsApp/shared/network/local/database_helper.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:flutter/material.dart';

class myProvider extends ChangeNotifier {
  List<NewsModel> myList = [];
  var myIcon = Icons.favorite_border_outlined;
  var iconColor = Colors.grey;

  // fetchDataFromSql() async {
  //   var databaseHepler = DatabaseHelper.db;
  //   await databaseHepler.readData();
  // }

  // makeItMarked() {
  //   myIcon = Icons.favorite;
  //   iconColor = Colors.red;
  //   notifyListeners();
  // }

  // makeItUnMarked() {
  //   myIcon = Icons.favorite_border_outlined;
  //   iconColor = Colors.grey;
  //   notifyListeners();
  // }

  addToMyList(NewsModel singleItem) async {
    myList.add(singleItem);
    await DatabaseHelper.insertData(singleItem);
    notifyListeners();
  }

  removeFromMyList(NewsModel singleItem) {
    for (int i = 0; i < myList.length; i++) {
      if (myList[i].title == singleItem.title) {
        myList.remove(myList[i]);
      }
    }
    DatabaseHelper.deleteOneItem(singleItem);
    notifyListeners();
  }

  fetchDataFromSQl() async {
    var listOfNews = await DatabaseHelper.getData();
    var list = listOfNews.map((e) => NewsModel.fromJson(e)).toList();
    myList = list;
    notifyListeners();
  }
}
