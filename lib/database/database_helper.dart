import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

class SQLHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute('''
      CREATE TABLE expense_sheet(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR(100),
        cost REAL,  
        createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
      )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), 'expense.db'),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> createEntry(String title, double cost) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'cost': cost,
    };
    final id = await db.insert('expense_sheet', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getEntries() async {
    final db = await SQLHelper.db();
    return db.query('expense_sheet', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('expense_sheet',
        where: "id = ?", whereArgs: [id], limit: 1);
  }
}
