import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      // créer database
      createDatabase();
    }
  }

  Future createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String database_directory = join(directory.path, 'database.db');
    var bdd = openDatabase(database_directory, version: 1, onCreate: _onCreate);

    return bdd;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE 
    item(id INTEGER PRIMARY KEY,
     nom TEXT NOT NULL)
    ''');
  }
}