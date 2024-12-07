import 'dart:developer';

import 'package:education_center/src/core/routes/router_config.dart';
import 'package:flutter/material.dart';

import '../../core/routes/app_route_names.dart';
import '../../core/storage/app_storage.dart';

class SplashViewModel extends ChangeNotifier {
  late final AnimationController controller;
  late final Animation<double> animation;

  void initialAnimations(TickerProvider value) {
    controller = AnimationController(
      vsync: value,
      duration: const Duration(seconds: 4),
    );
    animation = Tween(end: 0.80, begin: 0.1).animate(controller);
    controller.forward();
    stack();
  }

  Future<void> stack() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () async {
        await Future.delayed(const Duration(seconds: 3));
        String? token = await AppStorage.$read(key: StorageKey.token);
        if (token != null) {
          RouterConfigService.router.go(AppRouteNames.admin);
          log("{token: $token}");
        } else {
          RouterConfigService.router.go(AppRouteNames.login);
          log("{token else: $token}");
        }
      },
    );
  }
}
