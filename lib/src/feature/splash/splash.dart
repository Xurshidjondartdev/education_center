import "dart:developer";

import "package:education_center/src/core/routes/router_config.dart";
import "package:education_center/src/core/storage/app_storage.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:lottie/lottie.dart";
import "../../core/routes/app_route_names.dart";
import "../../core/style/app_colors.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animationni boshlash
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = Tween(begin: 0.1, end: 0.80).animate(_controller);
    _controller.forward();

    // Stack funksiyasini xavfsiz tarzda chaqirish
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializePage();
    });
  }

  Future<void> _initializePage() async {
    // 3 soniya kutish (Splash ekranida animatsiya uchun)
    await Future.delayed(const Duration(seconds: 3));

    // Token va rolni tekshirish
    await _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    // JWT token va rolni o'qish
    String? token = await AppStorage.$read(key: StorageKey.jwtToken);
    String? role = await AppStorage.$read(key: StorageKey.role);

    // Tokenni tekshirish
    if (token != null) {
      // Role tekshiriladi
      switch (role) {
        case "ROLE_ADMIN":
          RouterConfigService.router.go(AppRouteNames.admin);
          log("Admin sahifasiga yo'naltirildi: {token: $token}");
          break;
        case "ROLE_USER":
          RouterConfigService.router.go(AppRouteNames.teacherGroupPage);
          log("Teacher sahifasiga yo'naltirildi: {role: $role}");
          break;
        default:
          // Noma'lum rol holati, login sahifasiga yo'naltirish
          log("Noma'lum rol: {role: $role}");
          RouterConfigService.router.go(AppRouteNames.login);
          break;
      }
    } else {
      // Token mavjud emas, login sahifasiga yo'naltirish
      RouterConfigService.router.go(AppRouteNames.login);
      log("Token mavjud emas: {token: $token}");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: AnimatedContainer(
            height: 250,
            width: 330,
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FadeTransition(
                opacity: _animation,
                child: Lottie.asset(
                  "assets/lottie/loading.json",
                  height: 200.h,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
