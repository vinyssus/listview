import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    await database.execute(
        """CREATE TABLE contacts(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          nom TEXT,
          numero TEXT,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
        """
    );
  }

  static Future<Database> db() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    return openDatabase('first.db', version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(String nom, String? tel) async {
    final db = await SQLHelper.db();
    final data = {'nom': nom, 'numero': tel};
    final id = await db.insert('contacts', data,
        conflictAlgorithm: ConflictAlgorithm.replace
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('contacts', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('contacts', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String nom, String? numero
      ) async {
    final db = await SQLHelper.db();

    final data = {
      'nom': nom,
      'numero': numero,
      'createdAt': DateTime.now().toString()
    };

    final result = await db.update('contacts',
        data,
        where: "id = ?",
        whereArgs: [id]
    );

    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("contacts", where: "id = ?", whereArgs: [id]);
    }
    catch(err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}