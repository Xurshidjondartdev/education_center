import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../style/app_colors.dart';
import '../style/text_style.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool canPop;
  const CustomAppBarWidget(
      {super.key, required this.title, required this.canPop});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 68.h,
      centerTitle: true,
      backgroundColor: AppColors.white,
      leading: canPop
          ? IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.c1E1E1E,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.c1E1E1E90,
          fontSize: FontSize.size20,
          fontFamily: 'OpenSans-SemiBold',
          letterSpacing: 0.2.sp,
        ),
      ),
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
