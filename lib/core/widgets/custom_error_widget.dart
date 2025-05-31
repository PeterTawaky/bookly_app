import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage, style: AppTextStyles.textStyle20);
  }
}
