import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/app_colors.dart';

class LoginInputWidget extends StatefulWidget {
  final String hintText;
  final String? validatorText;
  final TextEditingController textEditingController;
  final bool isPassword;

  const LoginInputWidget({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.validatorText,
    this.isPassword = false,
  });

  @override
  State<LoginInputWidget> createState() => _LoginInputWidgetState();
}

class _LoginInputWidgetState extends State<LoginInputWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.isPassword ? _obscureText : false,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onEditingComplete: () {
          log(widget.textEditingController.text);
          FocusScope.of(context).nextFocus();
        },
        validator: (value) {
          if (value!.length >= 4 && value.isNotEmpty) {
            return null;
          } else {
            return widget.validatorText;
          }
        },
        style: const TextStyle(
            color: AppColors.c1E1E1E70,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        cursorColor: AppColors.c1E1E1E70,
        decoration: InputDecoration(
          contentPadding: REdgeInsets.only(top: 8, bottom: 8, left: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.c1E1E1E06),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.c1E1E1E70),
            borderRadius: BorderRadius.circular(8.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cFF0000),
            borderRadius: BorderRadius.circular(8.r),
          ),
          label: Text(widget.hintText),
          hintStyle: const TextStyle(color: AppColors.c1E1E1E20, fontSize: 16),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.c1E1E1E70,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
