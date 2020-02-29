import 'dart:async';
import 'dart:io';
import 'package:sqltry/models/user.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

String usertable="Table1";
String username="username";
String description="description";
String id="id";
class DataBaseHelper{
  static final DataBaseHelper _instance=new DataBaseHelper.internal();
  factory DataBaseHelper() {
    return _instance;
  }
  static Database _db;
  Future<Database> get db async{
    if(_db!=null){
      return _db;
    }
    _db = await initializedatabse();
    return _db;

  }


  DataBaseHelper.internal();
//initializing the database
  initializedatabse()async {
    Directory directory= await getApplicationDocumentsDirectory();
    String path=join(directory.path,"maindb.db");
    var ourdb=openDatabase(path,version: 1,onCreate: _onCreate);
    return ourdb;
  }


//creating a table
  void _onCreate(Database db, int version)async  {
    await db.execute(
     "CREATE TABLE $usertable($id INTEGER PRIMARY KEY,$username TEXT,$description TEXT)"
    );
  }

  Future<int> saveuser(User user)async{
    var dbclient=await db;
    int res=await dbclient.insert(usertable, user.toMap());
    return res;


  }
  
  Future<List> getallusers()async{
    var dbclient=await db;
    var res=await dbclient.rawQuery("SELECT * FROM $usertable");
    return res.toList();
    
  }
  Future<int> getcount()async {
    var dbclient=await db;
    return Sqflite.firstIntValue(
      await dbclient.rawQuery("SELECT COUNT(*) FROM $usertable")
    );

  }

  Future<User> getUser(int id1)async{
    var dbclient=await db;
    var res=await dbclient.rawQuery("SELECT * FROM $usertable WHERE $id=$id1");
    if(res.length==0)return null;
    return new User.fromMap(res.first);
  }
  Future<int> deleteUser(int id1)async{
    var dbclient =await db;
    return dbclient.delete(usertable,where: "$id=?",whereArgs: [id1]);
    
  }
  Future<int> updateuser(User user)async{
    var dbclient=await db;
    return await dbclient.update(usertable,user.toMap(),where: "$id=?",whereArgs: [user.id]);

  }



}