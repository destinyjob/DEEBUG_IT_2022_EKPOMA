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
static final columnId = 'id';
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
    String path = join(directory.path, _dbName);///joins our dbname to the directory (user/documents/myDatabase.db)
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);///This opens the database at the specified path and we use the oncreate parameter which receives a function to create our database table
  }



  Future _onCreate(Database db, int version) async{
    await db.execute(
        '''
      CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL
      )
      '''
    );///The primary key auto increment is incremented everytime a new record is inserted into the database, it does this automatically
    ///NOT NULL simply means that the specific column cannot be passed a null value
}


///Insert into the database, this is the function used for inserting into the databse
Future<int> insert(Map<String, dynamic> row) async{
  Database db = await instance.database;///We use this to get the instance of the database created (remember there's only on instance)
  return await db.insert(tableName, row);///Think of it like this, anytime you are inserting into the database, you are inserting into a table in specific row, that's why that 'row' is here.
}

  ///Update the database, this is the function we use in updating a specific row of a table
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;///Getting the instance of the database as usual
    int id = row[columnId];///The row receives a map of both Columnname and columnId but in this case we need just column id
    /// and that's what we are passing to the id, we use the id in editing a specific row

    ///The update method receives the table that needs updating, the specific row that needs updating and 'where' updates a specific row
    return await db.update(
        tableName, row, where: '$columnId = ?', whereArgs: [id]);///we pass the id to the whereArgs parameter to which in turn
    /// passes it to the columnId within the where parameter to tell the update method where to update
  }

  ///Query database function, this is the function we use to retrieve everything in the database
  Future <List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;///We instantiate the database as usual
    return await db.query(tableName);
  }

  ///Delete fucnction, this is the function we used in deleting a specific row or id in the database
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}