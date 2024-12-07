import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:education_center/src/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStudentsPage extends StatelessWidget {
  const AddStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "Add new students", canPop: true),
      body: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Spacer(),
              MainButton(text: "add ", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
