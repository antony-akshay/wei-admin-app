import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/screens/chat/widgets/custom_list_tile.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';

class PageviewTile extends StatefulWidget {
  const PageviewTile({super.key});

  @override
  State<PageviewTile> createState() => _PageviewTileState();
}

class _PageviewTileState extends State<PageviewTile> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> tabs = [
    {'label': 'Primary', 'count': "4"},
    {'label': 'Requests', 'count': "2"},
    {'label': 'Team', 'count': "2"},
  ];

  final List<Map<String, dynamic>> chats = [
    {
      'image':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Emma",
      'message': 'Hi Sangeeth',
      'time': '12:00PM',
      'count': 3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Micheal",
      'message': 'Hello! how are you',
      'time': '10:24AM',
      'count': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Sachin",
      'message': 'Hey 🙋‍♂️',
      'time': '12:00PM',
      'count': 0,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Emma",
      'message': 'Hi Sangeeth',
      'time': '12:00PM',
      'count': 3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Micheal",
      'message': 'Hello! how are you',
      'time': '10:24AM',
      'count': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Sachin",
      'message': 'Hey 🙋‍♂️',
      'time': '12:00PM',
      'count': 0,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Emma",
      'message': 'Hi Sangeeth',
      'time': '12:00PM',
      'count': 3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Micheal",
      'message': 'Hello! how are you',
      'time': '10:24AM',
      'count': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Sachin",
      'message': 'Hey 🙋‍♂️',
      'time': '12:00PM',
      'count': 0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 40.w,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: const Color(0xFF494949),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.5.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.backgroundColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          text: tabs[index]['label'],
                          fontSize: 16.sp,
                          height: 22.sp / 16.sp,
                        ),

                        SizedBox(width: 10.w),
                        Container(
                          height: 16.w,
                          width: 16.w,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryButtonColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: tabs[index]['count'],
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),

        SizedBox(height: 24.h),

        Expanded(
          child: Center(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 24.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: CustomListTile(
                        imagePath: chats[index]["image"],
                        name: chats[index]["name"],
                        lastMessage: chats[index]["message"],
                        messageCount: chats[index]["count"],
                        time: chats[index]["time"],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
