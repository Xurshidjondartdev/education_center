import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  TextEditingController loginC = TextEditingController(text: "+998939468430");
  TextEditingController passwordC = TextEditingController(text: "admin1234");

  final formKey = GlobalKey<FormState>();
}
