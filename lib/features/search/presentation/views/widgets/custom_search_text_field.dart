import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
        hintText: 'Search',
        hintStyle: AppTextStyles.textStyle16.copyWith(
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
