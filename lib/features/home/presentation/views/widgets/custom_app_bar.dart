import 'package:bookly_app/core/config/app_assets.dart';
import 'package:bookly_app/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Row(
        children: [
          Image.asset(Assets.imagesLogo, height: 20.h),
          Spacer(),
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoutes.searchView);
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 22.sp),
          ),
        ],
      ),
    );
  }
}
