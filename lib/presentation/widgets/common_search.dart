import 'package:flutter/material.dart';


import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';

class CommonSearch extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const CommonSearch({
    super.key,
    this.hintText = "Search",
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: CommonTextStyles.regular16,
      cursorWidth: 1,
      cursorColor: CommonColors.placeholderText,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: CommonColors.fileUpload,
        hintText: hintText,
        hintStyle: CommonTextStyles.regular16.copyWith(
          color: CommonColors.placeholderText,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 18, 10, 18),
          child: Image.asset(
            'assets/images/search-normal.png',
            width: 20,
            color: CommonColors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CommonColors.textFieldGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CommonColors.textFieldGrey),
        ),
      ),
    );
  }
}
