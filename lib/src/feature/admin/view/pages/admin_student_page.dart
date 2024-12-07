import 'package:education_center/src/feature/teacher/view_model/teacher_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/routes/router_config.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';

class AdminStudentPage extends ConsumerWidget {
  const AdminStudentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsVm = ref.watch(teacherVm);
    return Scaffold(
      appBar:
          const CustomAppBarWidget(title: "View all Students Admin", canPop: true),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: studentsVm.students.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final student = studentsVm.students[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        student["name"]!.isNotEmpty
                            ? student["name"]![0].toUpperCase()
                            : "",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text("${student["name"]} ${student["lastName"]}"),
                    subtitle: Text("Email: ${student["gmail"]}"),
                    onTap: () {},
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("talaba xaqida haqida ma'lumot"),
                            content: Text("${student["name"]}"),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouterConfigService.router.go(AppRouteNames.addStudentsPage);
        },
        child: const Icon(Icons.person_add_sharp),
      ),
    );
  }
}
