import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/buildteam/presentation/buildteam_screen.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class GroupItem {
  final String image;
  final String name;

  GroupItem({required this.image, required this.name});
}

class ProfileGroups extends StatelessWidget {
  final List<GroupItem>? groups;

  const ProfileGroups({super.key, this.groups});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(24.r),
        border: GradientBoxBorder(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF343434), Color(0xFF171717)],
          ),
          width: 2.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(41),
            offset: const Offset(8, 8),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white.withAlpha(10),
            offset: const Offset(-8, -8),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "My groups",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 18.sp,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          CustomText(text: 'My groups',fontSize: 18.sp,fontWeight: FontWeight.w600,),
          SizedBox(height: 20.h),
          if (groups == null || groups!.isEmpty)
            Center(
              child: Text(
                "No groups available",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            )
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...groups!.map(
                    (group) => Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(group.image),
                            radius: 33.r,
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            width: 70.w,
                            child: Text(
                              group.name.length > 11
                                  ? '${group.name.substring(0, 11)}...'
                                  : group.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Optional "New group" item
                  Column(
                    children: [
                      GestureDetector(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BuildTeamScreen1())),
                        child: Container(
                          height: 66.r,
                          width: 66.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: Icon(Icons.add, color: Colors.white, size: 30.r),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                       
                        child: CustomText(text: 'New group',fontSize: 14,fontWeight: FontWeight.w400,)
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
