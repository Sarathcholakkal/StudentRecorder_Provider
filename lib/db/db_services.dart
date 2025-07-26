import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:studentrecord/model/student.dart';

class DBService {
  static Database? _db;

  // Getter for database
  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initializeDatabase();
    return _db!;
  }

  // Initialize the database
  static Future<Database> _initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'student_db.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE studenttable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            emailID TEXT,
            subject TEXT,
            phonenumber TEXT,
            cgpa TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  // Add a student
  static Future<void> addStudent(Student student) async {
    final db = await database;
    await db.insert('studenttable', student.toMap());
  }

  // Get all students
  static Future<List<Student>> getAllStudents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('studenttable');
    return maps.map((map) => Student.fromMap(map)).toList();
  }

  static Future<void> deleteStudent(int id) async {
    final db = await database;
    await db.delete('studenttable', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateStudent(Student student) async {
    final db = await database;
    await db.update(
      'studenttable',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }
}
