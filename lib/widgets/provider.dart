import 'package:NewsApp/models/news_model.dart';
import 'package:flutter/material.dart';

class myProvider extends ChangeNotifier{
  List<NewsModel> myList=[];
  var myIcon= Icons.favorite_border_outlined;
  var iconColor= Colors.grey;

  makeItMarked(){
    myIcon=Icons.favorite;
    iconColor= Colors.red;
    notifyListeners();
  }

  makeItUnMarked(){
    myIcon=Icons.favorite_border_outlined;
    iconColor= Colors.grey;
    notifyListeners();

  }

  addToMyList(NewsModel singleItem){
    myList.add(singleItem);
    notifyListeners();
  }

  removeFromMyList(NewsModel singleItem){
    for(int i=0; i<myList.length; i++){
      if(myList[i].title==singleItem.title){
        myList.remove(myList[i]);
      }
    }
    notifyListeners();
  }
}