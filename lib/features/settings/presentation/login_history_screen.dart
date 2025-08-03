import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';

class Device {
  final IconData icon;
  final String name;
  final String dateTime;
  final bool isBlocked;

  Device({
    required this.icon,
    required this.name,
    required this.dateTime,
    required this.isBlocked,
  });
}

class DeviceData {
  final IconData icon;
  final String name;
  final String dateTime;

  DeviceData({required this.icon, required this.name, required this.dateTime});
}

class LoginHistoryScreen extends StatelessWidget {
  LoginHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
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
                            'Where you’re logged in',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'See what devices are used to log in to your accounts.',
                            style: GoogleFonts.urbanist(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(129, 129, 129, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ActiveDevicesScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveDevicesScreen extends StatefulWidget {
  ActiveDevicesScreen({super.key});

  @override
  State<ActiveDevicesScreen> createState() => _ActiveDevicesScreenState();
}

class _ActiveDevicesScreenState extends State<ActiveDevicesScreen> {
  final List<Device> devices = [
    Device(
      icon: Icons.smartphone,
      name: 'Nothing Phone 2(a)',
      dateTime: '20/07/2025 13:00 AM',
      isBlocked: false,
    ),
    Device(
      icon: Icons.laptop,
      name: 'Windows 10 XP',
      dateTime: '20/07/2025 13:00 AM',
      isBlocked: true,
    ),
    // Add more devices here if needed
  ];

  final List<DeviceData> previousHistory = [
    DeviceData(
      icon: Icons.phone_android_rounded,
      name: 'Nothing Phone 2(a)',
      dateTime: '20/07/2025 13:00 AM',
    ),
    DeviceData(
      icon: Icons.laptop_mac,
      name: 'MacBook Air M2',
      dateTime: '18/07/2025 10:30 AM',
    ),
    DeviceData(
      icon: Icons.phone_iphone,
      name: 'iPhone 13 Pro',
      dateTime: '15/07/2025 09:10 AM',
    ),
    DeviceData(
      icon: Icons.laptop_windows,
      name: 'Dell XPS 13',
      dateTime: '12/07/2025 22:15 PM',
    ),
    DeviceData(
      icon: Icons.phone_android_rounded,
      name: 'Samsung Galaxy S24',
      dateTime: '10/07/2025 17:45 PM',
    ),
    DeviceData(
      icon: Icons.laptop_mac,
      name: 'Lenovo ThinkPad X1',
      dateTime: '08/07/2025 08:30 AM',
    ),
    DeviceData(
      icon: Icons.laptop_windows,
      name: 'Dell XPS 13',
      dateTime: '12/07/2025 22:15 PM',
    ),
    DeviceData(
      icon: Icons.phone_android_rounded,
      name: 'Samsung Galaxy S24',
      dateTime: '10/07/2025 17:45 PM',
    ),
    DeviceData(
      icon: Icons.laptop_mac,
      name: 'Lenovo ThinkPad X1',
      dateTime: '08/07/2025 08:30 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 10),
            child: Text(
              'Now active devices',
              style: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: devices.length,
            itemBuilder: (context, index) {
              final device = devices[index];
              return Column(
                children: [
                  DeviceTile(
                    icon: device.icon,
                    deviceName: device.name,
                    dateTime: device.dateTime,
                    isBlocked: device.isBlocked,
                  ),
                  if (index != devices.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: const GlowingDivider(),
                    ), // Add spacing only if not last
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Previously logged devices',
              style: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          ListView.builder(
            itemCount: previousHistory.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final device = previousHistory[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        device.icon,
                        color: Colors.white70,
                        size: 20,
                      ),
                      title: Text(
                        device.name,
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      trailing: Text(
                        device.dateTime,
                        style: GoogleFonts.urbanist(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  if (index != previousHistory.length -1)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: const GlowingDivider(),
                    ), 
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class DeviceTile extends StatefulWidget {
  final IconData icon;
  final String deviceName;
  final String dateTime;
  bool isBlocked;

  DeviceTile({
    super.key,
    required this.icon,
    required this.deviceName,
    required this.dateTime,
    required this.isBlocked,
  });

  @override
  State<DeviceTile> createState() => _DeviceTileState();
}

class _DeviceTileState extends State<DeviceTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(widget.icon, color: Colors.white70, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.deviceName,
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                widget.dateTime,
                style: GoogleFonts.urbanist(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.isBlocked)
                GreyButton(
                  label: 'Unblock',
                  width: 100,
                  height: 36,
                  onTap: () {
                    // Add logic here
                    setState(() {
                      widget.isBlocked = !widget.isBlocked;
                    });
                  },
                )
              else
                _buildRedButton(context),
              const SizedBox(width: 12),
              GreyButton(
                label: 'Logout',
                width: 100,
                height: 36,
                onTap: () {
                  // Add logout logic
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isBlocked = !widget.isBlocked;
        });
      },
      child: Container(
        width: 100.w,
        height: 32.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE53935), Color(0xFFD32F2F)],
          ),
          borderRadius: BorderRadius.circular(33.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Block',
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class GlowingDivider extends StatelessWidget {
  const GlowingDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.05),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
