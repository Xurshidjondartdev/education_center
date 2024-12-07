import "package:education_center/src/core/setting/connetion_controller.dart";
import "package:education_center/src/core/setting/inherted_connection_notifair.dart";
import "package:flutter/material.dart";
import "../routes/router_config.dart";

final ConnectionController connetionController = ConnectionController();

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => InhertedConnectionNotifair(
        connetionController: connetionController,
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: RouterConfigService.router,
            );
          },
        ),
      );
}
