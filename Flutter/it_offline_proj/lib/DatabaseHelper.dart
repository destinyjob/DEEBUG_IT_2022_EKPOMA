
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  ///Singleton class
  DatabaseHelper._privateConstructor(); //This makes it impossible for this class to be instantiated except in the same file
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();////This makes it possible to call and use the private constructor of this class without calling its full declaration everytime

static final _dbName = 'myDatabase.db';
static final _dbVersion =  1;

static final tableName = 'myTable';
static final colmnId = 'id';
static final columnName = 'name';


///check wether the database is empty
static Database? _database;//This will be null at first

Future<Database> get database async{
  if(_database != null){
    return _database!;
  }
  ///this part runs when the above is null which would definitely by null upon creation of the databasee
  _database = await _initiateDatabase();
  return _database!;
}
//Initialize database, this handles the initialization of our databse
  Future _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();///Inititalize our database by first getting the directory our data would be stored using the Directory class
    String path = join(directory.path, _dbName);///joins our dbname to the directory (user/documents/ighalo)
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);///This opens the database at the specified path and we use the oncreate parameter which receives a function to create our database table
  }

  Future _onCreate(Database db, int version) {
    db.execute(
        '''
      CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL
      )
      '''
    );///The primary key auto increment is incremented everytime a new record is inserted into the database, it does this automatically
    ///NOT NULL simply means that the specific column cannot be passed a null value
  }
}