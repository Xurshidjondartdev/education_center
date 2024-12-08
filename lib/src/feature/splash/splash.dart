import "package:education_center/src/core/storage/app_storage.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = Tween(end: 0.80, begin: 0.1).animate(_controller);
    _controller.forward();

    // `stack` funksiyasini xavfsiz tarzda chaqirish
    WidgetsBinding.instance.addPostFrameCallback((_) {
      stack();
    });

    super.initState();
  }

  Future<void> stack() async {
    await Future.delayed(const Duration(seconds: 3));
    String? token = await AppStorage.$read(key: StorageKey.token);

    // Tokenni tekshirish va navigatsiya qilish
    if (token == null) {
      if (mounted) {
        context.go(AppRouteNames.login);
      }
    } else {
      if (mounted) {
        context.go(AppRouteNames.admin);
      }
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
