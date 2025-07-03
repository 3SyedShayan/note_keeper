import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();

  Database? _database;


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await getDatabase();
    return _database!;

  }
  Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    final fullPath = join(dbPath, 'notes.db');
    final database = await openDatabase(
      fullPath,
      version: 1,
      onCreate:
          (db, version) => db.execute(
            'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)',
          ),
    );
  return database;
  }
}
