// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reg_database/db/model/data_model.dart';

class DbProvider with ChangeNotifier {
  List<StudentModel> studentListNotifier = [];
  List foundUsers = [];
  void runFilter(String value) {
    List results = [];
    if (value.isEmpty) {
      results = studentListNotifier;
    } else {
      results = studentListNotifier
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    foundUsers = results;
    notifyListeners();
  }

  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);
    value.id = id;

    studentListNotifier.add(value);
    getAllStudents();

    notifyListeners();
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentListNotifier.clear();
    studentListNotifier.addAll(studentDB.values);

    notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(id);
    getAllStudents();
  }

  Future<void> updateStudentModel(int id, StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');

    await studentDB.putAt(id, value);
    getAllStudents();
  }
}
