import 'package:NewsApp/database_helper.dart';
import 'package:NewsApp/widgets/page1.dart';
import 'package:NewsApp/widgets/page2.dart';
import 'package:NewsApp/widgets/provider.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/const.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> listOfPages = [
    Page1(),
    Page2(),
  ];
  Database? database;
  // createDatabase() async {
  //   try {
  //     var databasesPath = await getDatabasesPath();
  //     String path = '$databasesPath news.db';
  //     print(path);
  //     database = await openDatabase(path, version: 1,
  //         onCreate: (Database db, int version) async {
  //       // When creating the db, create the table
  //       await db.execute(
  //           'CREATE TABLE news (id INTEGER PRIMARY KEY, sourceName TEXT, title TEXT, desc TEXT, url TEXT, urlToImage TEXT, content TEXT)');
  //     }, onOpen: (database) {
  //       print('Database is opened');
  //       getDatabase(database);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // insertDatabase() async {
  //   try {
  //     await database!.transaction((txn) async {
  //       int id1 = await txn.rawInsert(
  //           'INSERT INTO news(sourceName, title, desc, url, urlToImage, content) VALUES("some name1", "some name2", "some name3","some name4","some name5","some name6")');
  //       print('inserted1: $id1');
  //     });
  //   } catch (e) {
  //     print('insert error is $e');
  //   }
  // }

  // getDatabase(Database database) async {
  //   List<Map> list = await database.rawQuery('SELECT * FROM news');
  //   print(list.toString());
  // }

  @override
  void initState() {
    Provider.of<myProvider>(context, listen: false).fetchDataFromSQl();
    // createDatabase();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Widget returnPage(int index) {
    //   if (index == 0) {
    //     return Page1();
    //   } else
    //     return Page2();
    // }

    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: listOfPages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            // insertDatabase();
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: kBackGroundColor,
        elevation: 0,
        iconSize: 31.0.sp,
        showUnselectedLabels: false,
        selectedItemColor: kBackGroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: currentIndex == 1 ? Colors.grey : Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_sharp,
                color: currentIndex == 0 ? Colors.grey : Colors.blue),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
