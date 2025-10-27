import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'calculations.db');

    return await openDatabase(
      path,
      version: 2, // ✅ Bump version (forces onUpgrade)
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS calculations(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            expression TEXT,
            result TEXT,
            date TEXT,
            note TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // ✅ Add new columns if database already existed
          await db.execute("ALTER TABLE calculations ADD COLUMN date TEXT");
          await db.execute("ALTER TABLE calculations ADD COLUMN note TEXT");
        }
      },
    );
  }

  /// ✅ Insert a new calculation with date and note
  Future<void> insertCalculation(
    String expression,
    String result, {
    required String date,
    required String note,
  }) async {
    final db = await database;
    await db.insert(
      'calculations',
      {
        'expression': expression,
        'result': result,
        'date': date,
        'note': note,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// ✅ Retrieve all calculations
  Future<List<Map<String, dynamic>>> getCalculations() async {
    final db = await database;
    return await db.query('calculations', orderBy: 'id DESC');
  }

  /// ✅ Clear all calculations (for AC button)
  Future<void> clearCalculations() async {
    final db = await database;
    await db.delete('calculations');
  }
}
