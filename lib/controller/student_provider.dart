import 'package:flutter/material.dart';
import 'package:studentrecord/db/db_services.dart';
import 'package:studentrecord/model/student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> fetchStudents() async {
    _students = await DBService.getAllStudents();
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    await DBService.addStudent(student);
    await fetchStudents();
  }

  Future<void> deleteStudent(int id) async {
    await DBService.deleteStudent(id);
    await fetchStudents();
  }

  Future<void> updateStudent(Student updatedStudent) async {
    await DBService.updateStudent(updatedStudent);
    await fetchStudents();
  }
}
