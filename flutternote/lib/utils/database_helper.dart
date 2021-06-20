import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutternote/models/note.dart';

class DatabaseHelper {
  // ignore: unused_field
  static late DatabaseHelper
      _databaseHelper; // Singleton DatabaseHelper--> iT will only instansciate once

  static late Database _database;                // Singleton Database    
  
  String noteTable = 'note_table';
	String colId = 'id';
	String colTitle = 'title';
	String colDescription = 'description';
	String colPriority = 'priority';
	String colDate = 'date';


  DatabaseHelper._createInstance(); //Named Constructor to create instance of DatabaseHelper
  factory DatabaseHelper() {
    // ignore: unnecessary_null_comparison
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }
  	
  Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

  Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'notes.db';

		// Open/create the database at a given path
		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return notesDatabase;
	}

  void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
				'$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
	}



  // Fetch Operation: Get all note objects from database
	Future<List<Map<String, dynamic>>> getNoteMapList() async {
		Database db = await this.database;

		//var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(noteTable, orderBy: '$colPriority ASC');
		return result;
	}

  // Insert Operation: Insert a Note object to database
	Future<int> insertNote(Note note) async {
		Database db = await this.database;
		var result = await db.insert(noteTable, note.toMap());
		return result;
	}

  // Update Operation: Update a Note object and save it to database
	Future<int> updateNote(Note note) async {
		var db = await this.database;
		var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
		return result;
	}

}


