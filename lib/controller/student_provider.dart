import 'package:flutter/material.dart';
import 'package:studentrecord/db/db_services.dart';
import 'package:studentrecord/model/student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];
  List<Student> _filteredStudents = [];
  bool isSearching = false;
  bool noItemFound = false;

  List<Student> get students => isSearching ? _filteredStudents : _students;

  Future<void> fetchStudents() async {
    _students = await DBService.getAllStudents();
    _filteredStudents = List.from(_students);
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
  //! search functionality

  void searchStudents(String query) {
    if (query.isEmpty) {
      isSearching = false;
      noItemFound = false;
      _filteredStudents = List.from(_students);
    } else {
      isSearching = true;
      _filteredStudents = _students
          .where(
            (student) =>
                student.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      noItemFound = _filteredStudents.isEmpty;
    }
    notifyListeners();
  }
}
