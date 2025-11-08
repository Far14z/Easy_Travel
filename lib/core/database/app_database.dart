import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase _instance = AppDatabase._();

  factory AppDatabase() {
    return _instance;
  }

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'easy_travel.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE destinations ( 
      id INTEGER PRIMARY KEY,
      title TEXT, 
      poster_path, 
      TEXT, overview TEXT)''');
      },
    );
  }
}