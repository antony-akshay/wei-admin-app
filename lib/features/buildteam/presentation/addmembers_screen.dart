import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_button.dart';
import 'package:wei_admin/common_widgets/cancel_button.dart';
import 'package:wei_admin/features/buildteam/widgets/search_field.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class AddmembersScreen extends StatefulWidget {
  const AddmembersScreen({super.key});

  @override
  State<AddmembersScreen> createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddmembersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCenteredModal(context);
    });
  }

  List<Map<String, String>> allUsers = List.generate(
    10,
    (index) => {
      'name': 'Emma raducanu',
      'username': '@emma225${index + 6}',
      'avatar': 'https://i.pravatar.cc/150?img=${index + 6}',
    },
  );

  List<Map<String, String>> addedMembers = [];
  int? expandedIndex;

  void _toggleDropdown(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  void _addMember(int index, String role) {
    final user = allUsers[index];
    setState(() {
      allUsers.removeAt(index);
      addedMembers.add({...user, 'role': role});
      expandedIndex = null;
    });
  }

  void _removeMember(String username) {
    final member = addedMembers.firstWhere((m) => m['username'] == username);
    setState(() {
      addedMembers.removeWhere((m) => m['username'] == username);
      allUsers.add({
        'name': member['name']!,
        'username': member['username']!,
        'avatar': member['avatar']!,
      });
    });
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  CustomInnerShadowIconButton(
                    iconPath: "assets/icons/common/arrow_back.svg",
                    ontap: () => GoBackModal(context),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Build Your Team Space',
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          'Create a group, invite your crew, and make event planning a team sport.',
                          style: GoogleFonts.urbanist(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Top Avatar Row
              if (addedMembers.isNotEmpty)
                SizedBox(
                  height: 85,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: addedMembers.length,
                    itemBuilder: (context, index) {
                      final member = addedMembers[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 12,
                          top: 5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  radius: 21,
                                  backgroundImage: NetworkImage(
                                    member['avatar']!,
                                  ),
                                ),
                                Positioned(
                                  top: -4,
                                  right: -4,
                                  child: GestureDetector(
                                    onTap: () =>
                                        _removeMember(member['username']!),
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red.shade400,
                                      child: const Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              member['name']!.split(' ').first,
                              style: GoogleFonts.urbanist(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchField(
                    width: 350,
                    hint: 'Search...',
                    searchController: _searchController,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // List of Users with Dropdown
              Expanded(
                child: allUsers.isEmpty
                    ? Center(
                        child: Text(
                          'All users added!',
                          style: GoogleFonts.urbanist(color: Colors.white70),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: allUsers.length,
                          itemBuilder: (context, index) {
                            final user = allUsers[index];
                            final isExpanded = expandedIndex == index;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => _toggleDropdown(index),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        user['avatar']!,
                                      ),
                                    ),
                                    title: Text(
                                      user['name']!,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      user['username']!,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    trailing: Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                if (isExpanded)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 72,
                                      bottom: 12,
                                    ),
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        BuildteamButton(
                                          label: 'Add as coordinator',
                                          height: 32,
                                          width: 142,
                                          textWeight: FontWeight.w500,
                                          textSize: 12,
                                          onTap: () {
                                            _addMember(index, "coordinator");
                                          },
                                        ),
                                        BuildteamButton(
                                          label: 'Add as viewer',
                                          height: 32,
                                          width: 142,
                                          textWeight: FontWeight.w500,
                                          textSize: 12,
                                          onTap: () {
                                            _addMember(index, "viewer");
                                          },
                                        ),
                                        BuildteamButton(
                                          label: 'Add as Collaborator',
                                          height: 32,
                                          width: 142,
                                          textWeight: FontWeight.w500,
                                          textSize: 12,
                                          onTap: () {
                                            _addMember(index, "Collaborator");
                                          },
                                        ),
                                        BuildteamButton(
                                          label: 'Add as Editor',
                                          height: 32,
                                          width: 142,
                                          textWeight: FontWeight.w500,
                                          textSize: 12,
                                          onTap: () {
                                            _addMember(index, "Editor");
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
              ),

              // Footer Buttons
              Container(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: CancelButton(
                        label: 'Go back',
                        onTap: () => GoBackModal(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BuildteamButton(
                        onTap: () => GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.eventCreationYesOrNo),
                        label: 'Save and continue',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCenteredModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent, // No dark overlay; we blur manually
      builder: (context) {
        return Stack(
          children: [
            // Blur Background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Optional dark tint
              ),
            ),
            // Centered Modal
            Center(
              child: Container(
                width: 350,
                height: 250,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Do you want to add member ',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 12),
                      CustomText(
                        text:
                            'Invite new members to collaborate, manage tasks, or co-host events within this group.',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: CancelButton(
                              label: 'Cancel',
                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: BuildteamButton(
                              label: 'Add members',
                              onTap: () {
                                Navigator.pop(context); // Close modal
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void GoBackModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent, // No dark overlay; we blur manually
      builder: (context) {
        return Stack(
          children: [
            // Blur Background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Optional dark tint
              ),
            ),
            // Centered Modal
            Center(
              child: Container(
                width: 350,
                height: 250,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Do you want to save until you done!',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 12),
                      CustomText(
                        text:
                            'Save all the data you entered safe and you can use future',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: CancelButton(
                              label: 'No',
                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: BuildteamButton(
                              label: 'Yes',
                              onTap: () {
                                Navigator.pop(context); // Close modal
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
