import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AddStudentsPage extends StatelessWidget {
  const AddStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWidget(title: "Admin add new students", canPop: true),
      body: Center(
        child: Text(
          'This is the Add Students page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
