abstract class AppRepo {
  Future<String?> login({required String phone, required String password});

  Future<String?> creatTeacher({
    required String name,
    required String surname,
    required String phone,
    required String password,
  });
}
