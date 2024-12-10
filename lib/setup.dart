import 'package:education_center/src/core/storage/app_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String? jwtToken;
Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  jwtToken = await AppStorage.$read(key: StorageKey.jwtToken);
}
