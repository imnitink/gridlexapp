import 'package:gridlexapp/data/model/form_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqliteService {

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
       /*  await database.execute(
           "CREATE TABLE Form(id INTEGER PRIMARY KEY AUTOINCREMENT,"
               "name TEXT NOT NULL,"
               "mobileNo TEXT NOT NULL,"
               "email TEXT NOT NULL,"
               "dob TEXT NOT NULL,"
               "profilePicLink TEXT NOT NULL,"
               "status TEXT NOT NULL,"
               ")",
      );*/
         await database.execute(
             'CREATE TABLE Form (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, mobileNo TEXT, email TEXT, dob TEXT, profilePicLink TEXT, status TEXT)');

     },
     version: 1,
    );
  }



  static Future<void> createTables(Database database) async{
    await database.execute("""CREATE TABLE IF NOT EXISTS Form (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        mobileNo TEXT NOT NULL,
        email TEXT NOT NULL,
        dob TEXT NOT NULL,
        profilePicLink TEXT NOT NULL,
        status TEXT NOT NULL,
      )      
      """);
  }

/*  static Future<int> createItem(Note note) async {
    final db = await SqliteService.initizateDb();

    final id = await db.insert('Notes', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }*/

  // Read all notes
  Future<List> getItems() async {
    final db = await initializeDB();

   /* final List<Map<String, Object?>> queryResult = await db.query('Form');
    print(queryResult);
   // return queryResult.map((e) => FormModel.fromJson(e)).toList();
    return queryResult;*/

    List<Map> list = await db.rawQuery('SELECT * FROM Form');

    print(list);
    return list;
  }
}