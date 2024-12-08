import "package:flutter/material.dart";
import "../routes/router_config.dart";


class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: RouterConfigService.router,
          );
        },
      );
}
