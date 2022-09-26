import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:task/database/model/sqf_model.dart';

class EmpDb {
  static final EmpDb instance = EmpDb._init();
  static Database? _database;
  EmpDb._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('emp.db');
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
    const textTypeWn = "STRING NULL";

    // Table
    await db.execute('''
CREATE TABLE $tableEmp (
  ${EmpFields.id} $idType,
  ${EmpFields.name} $textTypeWon,
  ${EmpFields.username} $textTypeWon,
  ${EmpFields.email} $textTypeWon,
  ${EmpFields.profileImage} $textTypeWn,
  ${EmpFields.phone} $textTypeWn,
  ${EmpFields.website} $textTypeWn,
  ${EmpFields.street} $textTypeWon,
  ${EmpFields.suite} $textTypeWon,
  ${EmpFields.city} $textTypeWon,
  ${EmpFields.zipcode} $textTypeWon,
  ${EmpFields.lat} $textTypeWon,
  ${EmpFields.lng} $textTypeWon,
  ${EmpFields.companyName} $textTypeWn,
  ${EmpFields.catchPhrase} $textTypeWn,
  ${EmpFields.bs} $textTypeWn
)
''');
  }

  Future<Emp> create(Emp emp) async {
    final db = await instance.database;
    final id = await db.insert(tableEmp, emp.toJson());
    return emp.copy(id: id);
  }

  Future<Emp> readEmp(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableEmp,
      columns: EmpFields.values,
      where: '${EmpFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Emp.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<List<Emp>?> readAllEmployee() async {
    final db = await instance.database;
    final result = await db.query(tableEmp);
    return result.map((json) => Emp.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
