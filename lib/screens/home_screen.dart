
import 'package:NewsApp/widgets/page1.dart';
import 'package:NewsApp/widgets/page2.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/const.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex= 0;
  @override
  Widget build(BuildContext context) {
    Widget returnPage(int index){
      if(index==0){
        return Page1();
      }
      else
      return Page2();
    }
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body:  returnPage(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: kBackGroundColor,
        elevation: 0,
        iconSize: 40,
        showUnselectedLabels: false,
        selectedItemColor: kBackGroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: currentIndex==1 ? Colors.grey : Colors.blue),
            label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_sharp, color: currentIndex==0 ? Colors.grey : Colors.blue),
            label: 'Favorite',
            ),
        ],
      ),
    );
  }
}