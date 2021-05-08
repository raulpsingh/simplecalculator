import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:androidstudio/main.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{

  static final _dbName = 'record.db';
  static final _dbVersion = 1;
  static final _tablename = 'records';

  static final columnId='_id';
  static final columnFirst='_firstNumber';
  static final columnOperation='_operation';
  static final columnSecond='_secondNumber';
  static final columnResult= '_result';
  static final columnDate= "_date";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async{
    if(_database!=null) return _database;
    else
    _database = await _initiateDatabase();
      return _database;
  }
  _initiateDatabase() async{
    return await openDatabase(
        join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE $_tablename( $columnId INTEGER PRIMARY KEY,
    $columnFirst TEXT, $columnOperation TEXT, $columnSecond TEXT, $columnResult TEXT, $columnDate TEXT)
    ''');
        },
        version: _dbVersion
    );
  }
  Future<int> insert(Map<String,dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(_tablename,row);
  }

  Future<List<Map<String,dynamic>>> queryAll() async{
    Database db = await instance.database;
    return await db.query(_tablename);

  }

}


