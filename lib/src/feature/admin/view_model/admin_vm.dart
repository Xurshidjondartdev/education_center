import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminVM = ChangeNotifierProvider.autoDispose<AdminVM>((ref) {
  return AdminVM();
});

class AdminVM extends ChangeNotifier {
  TextEditingController addTeacherNameC = TextEditingController();
  TextEditingController addTeacherLastNameC = TextEditingController();
  TextEditingController addTeacherSubjectC = TextEditingController();
  TextEditingController addTeacherPassword = TextEditingController();
  TextEditingController addTeacherConfirmPass = TextEditingController();
  TextEditingController addTeacherPhoneNum = TextEditingController();



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

  final List<Map<String, String>> users = [
    {
      'name': 'John Nick',
      'position': 'Biology Teacher',
    },
    {
      'name': 'Jane Doe',
      'position': 'Chemistry Teacher',
    },
    {
      'name': 'Alice Mouse',
      'position': 'Physics Teacher',
    },
    {
      'name': 'Bob Chan',
      'position': 'Mathematics Teacher',
    },
    {
      'name': 'Charlie Chan',
      'position': 'English Teacher',
    },
  ];
}
