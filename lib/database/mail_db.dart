import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model/email_model.dart';

class MailDb {
  static final MailDb instance = MailDb._init();
  static Database? _database;
  MailDb._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('mail.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // Type
    const idType = "INTEGER NOT NULL";
    const textTypeWon = "STRING NOT NULL";

    // Table
    await db.execute('''
CREATE TABLE $tableMail (
  ${MailFields.id} $idType,
  ${MailFields.desc} $textTypeWon,
  ${MailFields.status} $textTypeWon,
  ${MailFields.dateTime} $textTypeWon
)
''');
  }

  Future<MailTable> create(MailTable emp) async {
    final db = await instance.database;
    final id = await db.insert(tableMail, emp.toJson());
    return emp.copy(id: id);
  }

  Future<MailTable> readEmp(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableMail,
      columns: MailFields.values,
      where: '${MailFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return MailTable.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<List<MailTable>?> readAllEmployee() async {
    final db = await instance.database;
    final result = await db.query(tableMail);
    return result.map((json) => MailTable.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future delete() async {
    final db = await instance.database;
    db.delete(tableMail);
  }
}
