import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.r),
      child: SizedBox(
        width: width,
        child: InnerShadow(
          shadows: [
            BoxShadow(
              color: Colors.black.withAlpha(46),
              offset: Offset(-6, -6),
              blurRadius: 12,
            ),
            BoxShadow(
              color: Colors.white.withAlpha(20),
              offset: Offset(6, 6),
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
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white),
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
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
