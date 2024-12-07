import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teacherVm = ChangeNotifierProvider.autoDispose<TeacherVM>((ref) {
  return TeacherVM();
});

class TeacherVM extends ChangeNotifier {
  TextEditingController studentsName = TextEditingController();
  TextEditingController studentsLastName = TextEditingController();
  TextEditingController studentsGmail = TextEditingController();

  final List<Map<String, String>> groups = [
    {
      'name': 'Biology',
      'position': 'Full time',
    },
    {
      'name': 'Character',
      'position': 'Half time',
    },
    {
      'name': 'History',
      'position': 'Full time',
    },
    {
      'name': 'Chemistry',
      'position': 'Full time',
    },
    {
      'name': 'Mathematics',
      'position': 'Full time',
    },
    {
      'name': 'Political',
      'position': 'Full time',
    },
  ];

  final List<Map<String, dynamic>> students = [
    {
      'name': 'John',
      "lastName": "Nick",
      "gmail": "@xurshidjonthebest@gmail.com",
      "dateOfBirth": "2003.12.26",
      "isSelected": false,
      "isLlate": true
    },
    {
      'name': 'Jane',
      "lastName": "Doe",
      "gmail": "@janedoe@gmail.com",
      "dateOfBirth": "1998.05.15",
      "isSelected": false,
      "isLlate": true
    },
    {
      'name': 'Alice',
      "lastName": "Smith",
      "gmail": "@alicesmith@gmail.com",
      "dateOfBirth": "2001.07.10",
      "isSelected": false,
      "isLlate": true
    },
    {
      'name': 'Bob',
      "lastName": "Johnson",
      "gmail": "@bobjohnson@gmail.com",
      "dateOfBirth": "1995.03.05",
      "isSelected": false,
      "isLlate": true
    },
  ];

  void isLate(int index, bool value) {
    students[index]['isLate'] = value;
    notifyListeners();
  }

  void isSelected(int index, bool value) {
    students[index]['isSelected'] = value;
    notifyListeners();
  }
}
