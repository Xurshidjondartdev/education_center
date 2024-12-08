import 'package:education_center/src/data/model/login_model.dart';

abstract class AppRepo {
  
  Future<LoginModel?> login({required String phone, required String password});
}
