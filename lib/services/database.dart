import 'package:note_keeper/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }
  Future<Database> get database async {
    if (database == null) {
      _database = await _initalizeDatabase();
    }
    return _database!;
  }

  Future<Database> _initalizeDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'notes.db');
    var notesDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return notesDatabase;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $noteTable (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colTitle TEXT,
        $colDescription TEXT,
        $colPriority INTEGER,
        $colDate TEXT
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getNotes(int id) async {
    Database db = await database;
    var results = await db.query(noteTable, orderBy: '$colPriority ASC');
    return results;
  }

  void insertNote(Note note) async {
    Database db = await database;
    var result = await db.insert(noteTable, note.toMap());
    print('Inserted note with id: $result');
  }

  void updateNote(Note note) async {
    Database db = await database;
    var result = await db.update(
      noteTable,
      note.toMap(),
      where: '$colId = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    var db = await database;
    var result = db.delete(noteTable, where: '$colId = ?', whereArgs: [id]);
    print('Deleted note with id: $id');
    print(result);
    return result;
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x = await db.rawQuery(
      'SELECT COUNT (*) from $noteTable',
    );
    int? result = Sqflite.firstIntValue(x);
    return result ?? 0;
  }

  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNotes(1);
    int count = noteMapList.length;

    List<Note> noteList = <Note>[];
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }
    return noteList;
  }
}
