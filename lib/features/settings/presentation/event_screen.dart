import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/common_widgets/search_textfield.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';


class EventScreen extends StatefulWidget {
  final bool isPaid;

  const EventScreen({super.key, required this.isPaid});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {}); // triggers animation change
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFeedbackTab = _tabController.index == 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            // Animated section (image or search bar)
            AnimatedSwitcher(
  duration: const Duration(milliseconds: 500),
  transitionBuilder: (child, animation) {
    // Different animation for disappearing
    final inAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutBack,
    );
    final outAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeIn,
    );

    return ScaleTransition(
      scale: child.key == const ValueKey('image') ? outAnimation : inAnimation,
      child: FadeTransition(opacity: animation, child: child),
    );
  },
  child: isFeedbackTab
      ? Padding(
          key: const ValueKey('searchRow'),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomInnerShadowIconButton(
                iconPath: "assets/icons/common/filter.svg",
              ),
              SearchTextfield(width: 295.w),
            ],
          ),
        )
      : const EventCarouselTile(key: ValueKey('image')),
),

            SizedBox(height: 16.h),

            // Tabs
            _buildTabs(),


            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildDetailsTab(), _buildFeedbacksTab()],
              ),
            ),

            // Bottom buttons only for details tab
            if (!isFeedbackTab) _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  // HEADER
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CustomInnerShadowIconButton(
              iconPath: "assets/icons/common/arrow_back.svg",
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Events hosted',
                  style: GoogleFonts.urbanist(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'A summary of all previously conducted events',
                  style: GoogleFonts.urbanist(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(129, 129, 129, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // IMAGE SECTION
  Widget _eventImageSection() {
    return Container(
      key: const ValueKey('image'),
      height: 180.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey[800],
      ),
      child: const Center(
        child: Text("Event Image", style: TextStyle(color: Colors.white70)),
      ),
    );
  }

  // TABS
  Widget _buildTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Color.fromRGBO(94, 92, 230, 1),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(text: "Details"),
          Tab(text: "Feedbacks"),
        ],
      ),
    );
  }

  // DETAILS TAB
  Widget _buildDetailsTab() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      children: [
        _detailRow("Event name", "Coldplay concert"),
        _detailRow("Type", "Seminar"),
        _detailRow("Sub category", "Technology"),
        _detailRow("Date", "20/08/2025"),
        _detailRow("Location", "Online"),
        _detailRow("Attendance", "22,666"),
        _ratingRow(),
        _statusRow(),
      ],
    );
  }

  // FEEDBACKS TAB
  Widget _buildFeedbacksTab() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return GlowingDivider();
      },
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey[800]),
          title: Row(
            children: [
              Row(
                children: List.generate(
                  4,
                  (i) => const Icon(Icons.star, color: Colors.amber, size: 16),
              
                ),
              ),
              CustomText(text: ' \\5',fontWeight: FontWeight.w200,fontSize: 12,)
            ],
          ),
          subtitle: Text(
            '"Excellent speakers and great networking opportunities!" ~ User$index',
            style: GoogleFonts.urbanist(color: Colors.white, fontSize: 12.sp),
          ),
        );
      },
    );
  }

  // BOTTOM BUTTONS (Details only)
  Widget _buildBottomButtons() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: widget.isPaid
          ? Row(
              children: [
                Expanded(child: _greyButton("Event Details")),
                SizedBox(width: 12.w),
                Expanded(child: _colorButton("Payment details")),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GreyButton(label: 'Event Details', width: 167, height: 42),
              ],
            ),
    );
  }

  // UTILS / SMALL WIDGETS
  Widget _detailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _labelText(label),
          Flexible(
            child: Text(
              value,
              style: GoogleFonts.urbanist(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelText(String text) {
    return Text(
      "$text :",
      style: GoogleFonts.urbanist(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: const Color.fromRGBO(129, 129, 129, 1),
      ),
    );
  }

  Widget _ratingRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _labelText("Rating"),
          Row(
            children: List.generate(
              3,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _labelText("Status"),
          Container(
            width: 89,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const Center(
              child: Text(
                'Completed',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterButton() {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white12),
      child: const Icon(Icons.filter_list, color: Colors.white),
    );
  }

  Widget _searchTextField() {
    return Expanded(
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search feedbacks",
          hintStyle: const TextStyle(color: Colors.white54),
          filled: true,
          fillColor: Colors.white12,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _greyButton(String label) {
    return GreyButton(label: label, width: 167, height: 42);
  }

  Widget _colorButton(String label) {
    return ColorButton(label: label, width: 167, height: 42);
  }
}


class EventCarouselTile extends StatefulWidget {
  const EventCarouselTile({super.key});

  @override
  State<EventCarouselTile> createState() => _EventCarouselTileState();
}

class _EventCarouselTileState extends State<EventCarouselTile> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 350,
          height: 167,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
              ),
              BoxShadow(
                color: Colors.white.withAlpha(10),
                offset: const Offset(-8, -8),
                blurRadius: 12.w,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: AspectRatio(
              aspectRatio: 16 / 9, // Keeps the image proportional
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/images/test_image_2.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.white38,
            dotHeight: 8.h,
            dotWidth: 8.w,
            spacing: 8.w,
          ),
        ),
      ],
    );
  }}