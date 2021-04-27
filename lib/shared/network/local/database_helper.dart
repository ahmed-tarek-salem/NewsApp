import 'package:NewsApp/shared/components/const.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // DatabaseHelper._();

  // static final DatabaseHelper db = DatabaseHelper._();

  // static late Database _database;

  // get database async {
  //   if (_database != null) {
  //     return _database;
  //   }
  //   _database = await createDatabase();
  //   return _database;
  // }
  //
  static Future<Database> database() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'favoriteNews.db');

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      //make columnId is url to delete or update it later
      print('Database is created');
      return await db.execute('''
  CREATE TABLE $tableNews (
  $columnId TEXT PRIMARY KEY,
  $columnTitle TEXT,
  $columnDesc TEXT,
  $columnUrl TEXT,
  $columnUrlToImage TEXT,
  $columnContent TEXT,
  $columnSourceName TEXT)
''');
    });
  }

  static insertData(NewsModel newsModel) async {
    try {
      final db = await DatabaseHelper.database();
      db.insert('$tableNews', newsModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print('is Inserted');
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    try {
      final db = await DatabaseHelper.database();
      var list = await db.query(tableNews);
      print(list.toString());
      return list;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  static deleteOneItem(NewsModel newsModel) async {
    try {
      final db = await DatabaseHelper.database();
      //I made the Id for each model its url
      db.delete(tableNews, where: '$columnId = ?', whereArgs: [newsModel.url]);
    } catch (e) {
      print(e);
    }
  }

  // insertData(NewsModel newsModel) async {
  //   try {
  //     Database dbClient = await database;
  //     await dbClient.insert(tableNews, newsModel.toJson(),
  //         conflictAlgorithm: ConflictAlgorithm.replace);

  //     // print('$data is inserted');
  //   } catch (e) {
  //     print(e)
  //   }
  // }

  // readData() async {
  //   try {
  //     Database dbClient = _database;
  //     List<Map<String, dynamic>> maps = await dbClient.query(tableNews);
  //     List<NewsModel> list = maps.isNotEmpty
  //         ? maps.map((e) => NewsModel.fromJson(e)).toList()
  //         : [];
  //     print(list.toString());
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
