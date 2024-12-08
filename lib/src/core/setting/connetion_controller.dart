import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final connectionControllerProvider =
    ChangeNotifierProvider<ConnectionController>((ref) {
  return ConnectionController();
});

class ConnectionController with ChangeNotifier {
  bool isDeviceConnectionEnable = false;
  late Timer _timer;

  ConnectionController() {
    listenDeviceConnectionEnable();
  }

  void listenDeviceConnectionEnable() {
    // Check connectivity every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) async {
      isDeviceConnectionEnable = await checkInternetConnection();
      notifyListeners();
      log(isDeviceConnectionEnable
          ? 'connection enable $isDeviceConnectionEnable'
          : 'connection not enable $isDeviceConnectionEnable');
    });
  }

  Future<bool> checkInternetConnection() async {
    try {
      // Attempt to connect to Google
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
