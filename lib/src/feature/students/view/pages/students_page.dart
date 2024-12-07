import 'package:education_center/src/core/widgets/main_button.dart';
import 'package:education_center/src/feature/students/view_model/students_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar_widget.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsVm = ref.watch(studentsVM);
    return Scaffold(
      appBar:
          const CustomAppBarWidget(title: "View all Students", canPop: true),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Text(
              "Davomat qilish uchun belgi qo`ying !",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Divider(), // Matndan keyin ajratgich
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
                    trailing: Checkbox(
                      value: student['isSelected'],
                      onChanged: (value) {
                        if (value != null) {
                          studentsVm.isSelected(index, value);
                        }
                      },
                    ),
                    onTap: () {
                      // Qo'shimcha harakatlar uchun
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Kechikish haqida ma'lumot"),
                            content: Text("${student["name"]} kechikdimi?"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Yo'q"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  studentsVm.isLate(index, true);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.red, // Tugma foni qizil rangda
                                  foregroundColor:
                                      Colors.white, // Matn rangi oq
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight
                                          .bold), // Matnni qalin qilish
                                ),
                                child: const Text("Ha"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            MainButton(text: "Davomatni Yakunlash", onTap: () {}),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.person_add_sharp),
          ),
          SizedBox(height: 70.h)
        ],
      ),
    );
  }
}
