import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool isEventCreationConfirmations = true;
  bool isEventEditsOrCancellations = true;
  bool isUpcomingEventReminders = true;

  bool isBankTransferUpdates = true;
  bool isTicketSalesAlerts = true;

  bool isGroupDeletionWarnings = true;
  bool isNewMemberJoinedYourGroup = true;

  bool isLoginFromNewDevice = true;
  bool isPasswordChangeConfirmations = true;
  bool is2FASetupSuccessFailure = true;
  bool isBankAccountInfoUpdated = true;

  bool isNewToolsOrFeaturesLaunched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                            'Notification settings',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Set the tone for your notifications - updates, reminders, and good news, your way.',
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
                SizedBox(height: 20.h),
                buildSectionTitle('Event Notifications'),
                NotificationToggleTile(
                  title: 'Event creation confirmations',
                  value: isEventCreationConfirmations,
                  onChanged: (value) {
                    setState(() => isEventCreationConfirmations = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'Event edits or cancellations',
                  value: isEventEditsOrCancellations,
                  onChanged: (value) {
                    setState(() => isEventEditsOrCancellations = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'Upcoming event reminders',
                  value: isUpcomingEventReminders,
                  onChanged: (value) {
                    setState(() => isUpcomingEventReminders = value);
                  },
                ),
                GlowingDivider(),
                SizedBox(height: 20.h),
                buildSectionTitle('Revenue & Payment Alerts'),
                NotificationToggleTile(
                  title: 'Bank transfer updates',
                  value: isBankTransferUpdates,
                  onChanged: (value) {
                    setState(() => isBankTransferUpdates = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'Ticket sales alerts',
                  value: isTicketSalesAlerts,
                  onChanged: (value) {
                    setState(() => isTicketSalesAlerts = value);
                  },
                ),
                GlowingDivider(),
                SizedBox(height: 20.h),
                buildSectionTitle('Group & Collaboration Alerts'),
                NotificationToggleTile(
                  title: 'Group deletion warnings',
                  value: isGroupDeletionWarnings,
                  onChanged: (value) {
                    setState(() => isGroupDeletionWarnings = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'New member joined your group',
                  value: isNewMemberJoinedYourGroup,
                  onChanged: (value) {
                    setState(() => isNewMemberJoinedYourGroup = value);
                  },
                ),
                GlowingDivider(),
                SizedBox(height: 20.h),
                buildSectionTitle('Security & Account Activity'),
                NotificationToggleTile(
                  title: 'Login from new device',
                  value: isLoginFromNewDevice,
                  onChanged: (value) {
                    setState(() => isLoginFromNewDevice = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'Password change confirmations',
                  value: isPasswordChangeConfirmations,
                  onChanged: (value) {
                    setState(() => isPasswordChangeConfirmations = value);
                  },
                ),
                NotificationToggleTile(
                  title: '2FA setup success/failure',
                  value: is2FASetupSuccessFailure,
                  onChanged: (value) {
                    setState(() => is2FASetupSuccessFailure = value);
                    print("2fa:${value}");
                  },
                ),
                NotificationToggleTile(
                  title: 'Bank account info updated',
                  value: isBankAccountInfoUpdated,
                  onChanged: (value) {
                    setState(() => isBankAccountInfoUpdated = value);
                    print("bank info:${value}");
                  },
                ),
                GlowingDivider(),
                SizedBox(height: 20.h),
                buildSectionTitle('Promotional & Feature Updates'),
                NotificationToggleTile(
                  title: 'New tools or features launched',
                  value: isNewToolsOrFeaturesLaunched,
                  onChanged: (value) {
                    setState(() => isNewToolsOrFeaturesLaunched = value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.urbanist(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}

class GradientSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const GradientSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<GradientSwitch> createState() => _GradientSwitchState();
}

class _GradientSwitchState extends State<GradientSwitch>
    with SingleTickerProviderStateMixin {
  late bool _isOn;

  @override
  void initState() {
    _isOn = widget.value;
    super.initState();
  }

  void _toggle() {
    setState(() => _isOn = !_isOn);
    widget.onChanged(_isOn);
  }

  @override
  void didUpdateWidget(covariant GradientSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _isOn = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 60,
        height: 31,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: _isOn
              ? const LinearGradient(
                  colors: [Color(0xFF121212), Color(0xFF1E1E1E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: _isOn ? null : Colors.grey.shade900,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 104, 90, 255), Color(0xFF9C8CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7366FF).withOpacity(0.4),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationToggleTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? textColor;
  final double? fontSize;

  const NotificationToggleTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontSize: fontSize ?? 14, // Default to 14 if not provided
            fontWeight: FontWeight.w600,
            fontColor: textColor ?? Colors.white, // Default to white if not provided
          ),
          GradientSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
