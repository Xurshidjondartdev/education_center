import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupVM = ChangeNotifierProvider.autoDispose<GroupVM>((ref) {
  return GroupVM();
});

class GroupVM extends ChangeNotifier {
  TextEditingController addTeacherNameC = TextEditingController();
  TextEditingController addTeacherLastNameC = TextEditingController();
  TextEditingController addTeacherSubjectC = TextEditingController();

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
}
