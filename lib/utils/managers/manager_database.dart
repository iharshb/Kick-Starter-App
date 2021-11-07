// import 'package:flutter/cupertino.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io' as io;
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:kickstarter/utils/constants/constants_database.dart';
//
// class DatabaseHelper {
//   static Database? database;
//
//   //singleton instance
//   static DatabaseHelper sharedInstance = DatabaseHelper._internal();
//
//   factory DatabaseHelper() {
//     return sharedInstance;
//   }
//
//   DatabaseHelper._internal();
//
//   Future<Database?> get instance async {
//     if (database != null) {
//       return database;
//     }
//     database = await initDatabase();
//     return database;
//   }
//
//   initDatabase() async {
//     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, databaseName);
//     var db = await openDatabase(path, version: databaseVersion, onCreate: _onCreateTables);
//     return db;
//   }
//
//   _onCreateTables(Database db, int version) async {
//     await createCartTable(db);
//   }
//
//   Future createCartTable(Database db) async {
//     await db.execute(
//         "CREATE TABLE ${CartTable.tbCartDetails} ( ${CartTable.colID} INTEGER PRIMARY KEY AUTOINCREMENT, ${CartTable.colTitle} TEXT NOT NULL,"
//         " ${CartTable.colImage} TEXT NOT NULL, ${CartTable.colPrice} TEXT NOT NULL, ${CartTable.colColor} TEXT NOT NULL,"
//         " ${CartTable.colSizeSelect} TEXT NOT NULL )");
//   }
//
//   /// Insert Record
//   Future<dynamic> insertRecord(dynamic data, String tableName) async {
//     var dbClient = await instance;
//     return await dbClient!.insert(tableName, data.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   /// Get records
//   Future<List<dynamic>> getRecords(String table,
//       {List<String>? columns,
//       String? where,
//       List<dynamic>? args,
//       String? groupBy,
//       String? orderBy,
//       int? limit,
//       int? offset}) async {
//     var dbClient = await instance;
//
//     return await dbClient!.query(table,
//         columns: columns,
//         where: where,
//         whereArgs: args,
//         groupBy: groupBy,
//         orderBy: orderBy,
//         limit: limit,
//         offset: offset);
//   }
//
//   /// Update records
//   Future<dynamic> updateRecord(
//       {required String table,
//       required List<String> whereColumns,
//       required List<dynamic> valuesCondition,
//       required Map<String, Object?> updateData}) async {
//     var dbClient = await instance;
//
//     String where = '';
//     for (var column in whereColumns) {
//       where += " $column=? and";
//     }
//     where = where.substring(0, where.length - 3);
//
//     debugPrint("Update => $table -> where :$where values:$valuesCondition Data:$updateData");
//
//     return await dbClient!.update(table, updateData, where: where, whereArgs: valuesCondition);
//   }
//
//   /// Delete records
//   Future<dynamic> deleteRecord(
//       {required String table, List<String>? whereColumns, List<dynamic>? valuesCondition}) async {
//     var dbClient = await instance;
//     String where = '';
//     for (var column in whereColumns!) {
//       where += " $column=? and";
//     }
//     where = where.substring(0, where.length - 3);
//
//     debugPrint("Delete => $table -> where: $where  values:$valuesCondition");
//
//     return await dbClient!.delete(table, where: where, whereArgs: valuesCondition);
//   }
//
//   Future close() async {
//     var dbClient = await instance;
//     dbClient!.close();
//   }
// }
