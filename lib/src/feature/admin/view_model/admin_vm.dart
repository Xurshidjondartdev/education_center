import 'dart:convert';
import 'dart:developer';

import 'package:education_center/src/data/model/create_model.dart';
import 'package:education_center/src/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository/app_repository_impl.dart';

final adminVM = ChangeNotifierProvider.autoDispose<AdminVM>((ref) {
  return AdminVM();
});

class AdminVM extends ChangeNotifier {
  TextEditingController addTeacherNameC =
      TextEditingController(text: "Teacher Name");
  TextEditingController addTeacherSurnameC =
      TextEditingController(text: "Teacher Surname");
  TextEditingController addTeacherSubjectC =
      TextEditingController(text: "Teacher Subject");
  TextEditingController addTeacherPassword =
      TextEditingController(text: "Teacher Password");
  TextEditingController addTeacherConfirmPass = TextEditingController();
  TextEditingController addTeacherPhoneNum =
      TextEditingController(text: "+9989394684");
  TextEditingController timeGroupC = TextEditingController();

  bool isLoading = false;
  List<LoginModel> users = [];

  Future<void> getTeacher() async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await AppRepositoryImpl().getTeacher();
      if (result != null) {
        final parsedResult = jsonDecode(result);
        if (parsedResult is List) {
          final loginModelList = parsedResult
              .map((teacher) => LoginModel.fromJson(teacher))
              .toList();
          users = loginModelList;
        } else {
          log("Error: Serverdan kutilgan ro'yxat emas, boshqa format keldi.");
          users = [];
        }
      } else {
        users = [];
      }
    } catch (e) {
      log("Error 1: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> crateTeacher({
    required String name,
    required String surname,
    required String phone,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await AppRepositoryImpl().creatTeacher(
        name: name,
        surname: surname,
        phone: phone,
        password: password,
      );
      if (result != null) {
        final createModel = createModelFromJson(result);
        log(createModel.toString());
        isLoading = true;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("Error: $e");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

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
