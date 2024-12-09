import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'core/widgets/app_material_context.dart';
import 'core/widgets/custom_screen_util.dart';
import 'feature/splash/error_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  static void run() => runApp(const ProviderScope(child: App()));

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref('isHomePage');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: _databaseRef.onValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasError) {
          return const MaterialApp(
            home: ErrorPage(),
          );
        } else if (snapshot.hasData) {
          final dynamic value = snapshot.data!.snapshot.value;
          final isHomePage = value as bool? ?? false;

          if (isHomePage) {
            return const CustomScreenUtil(
              enabledPreview: false,
              child: AppMaterialContext(),
            );
          } else {
            return const MaterialApp(
              home: ErrorPage(),
            );
          }
        }
        return const MaterialApp(
          home: ErrorPage(),
        );
      },
    );
  }
}
