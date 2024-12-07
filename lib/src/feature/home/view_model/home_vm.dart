import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeVM = ChangeNotifierProvider.autoDispose<HomeVM>((ref) {
  return HomeVM();
});

class HomeVM extends ChangeNotifier {
  TextEditingController addTeacherNameC = TextEditingController();
  TextEditingController addTeacherLastNameC = TextEditingController();
  TextEditingController addTeacherSubjectC = TextEditingController();

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
