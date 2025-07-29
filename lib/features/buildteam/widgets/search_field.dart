import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: SizedBox(
          width: width,
          child: InnerShadow(
            shadows: [
              BoxShadow(
                color: Colors.black.withAlpha(46),
                offset: const Offset(-6, -6),
                blurRadius: 12,
              ),
              BoxShadow(
                color: Colors.white.withAlpha(20),
                offset: const Offset(6, 6),
                blurRadius: 12,
              ),
            ],
            child: Container(
              height: 45.w,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
