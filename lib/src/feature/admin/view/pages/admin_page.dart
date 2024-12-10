import 'dart:developer';

import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/routes/router_config.dart';
import '../../view_model/admin_vm.dart';
import '../widgets/admin_main_widget.dart';

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});

  @override
  ConsumerState<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminPage> {
  @override
  void initState() {
    super.initState();
    // Page ochilganda getTeacher funksiyasini chaqirish
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminVM).getTeacher();
    });
  }

  @override
  Widget build(BuildContext context) {
    final adminVm = ref.watch(adminVM);

    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Education Center",
        canPop: false,
      ),
      body: adminVm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : adminVm.users.isEmpty
              ? const Center(child: Text("Hozircha o'qituvchilar yo'q"))
              : Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: ListView.separated(
                    itemCount: adminVm.users.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final user = adminVm.users[index];
                      return ProfileCard(
                        name: user.name!,
                        position: user.surname!,
                        onActionPressed: () {
                          log("${user.name} darsni boshladi");
                          RouterConfigService.router.go(
                              "${AppRouteNames.admin}/${AppRouteNames.adminGroupPage}");
                        },
                        onCardPressed: () async {
                          await adminVm.getTeacher();
                        },
                        onEditPressed: () {
                          RouterConfigService.router.go(AppRouteNames.addTeacher);
                        },
                        onDeleteConfirmed: () {
                          // O'chirish funksiyasi
                        },
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouterConfigService.router
              .go("${AppRouteNames.admin}/${AppRouteNames.addTeacher}");
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
