import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:chatview/chatview.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.profilePicPath, required this.name});
  final String profilePicPath;
  final String name;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatController _chatController;

  TextEditingController messageTextController = TextEditingController();

  // Current user (you)
  final ChatUser currentUser = ChatUser(id: '1', name: 'You', profilePhoto: '');

  // Other user
  late ChatUser otherUser;

  @override
  void initState() {
    super.initState();

    // Initialize other user
    otherUser = ChatUser(
      id: '2',
      name: widget.name,
      profilePhoto: widget.profilePicPath,
    );

    // Initialize chat controller with sample messages
    _chatController = ChatController(
      initialMessageList: _getInitialMessages(),
      scrollController: ScrollController(),
      currentUser: currentUser,
      otherUsers: [otherUser],
    );
  }

  List<Message> _getInitialMessages() {
    return [
      Message(
        id: '1',
        message:
            'tthe plural of the Latin word illuminatus, meaning "enlightened"—is a name that has been in use since the late 15th century and has been applied to various groups since',
        createdAt: DateTime.now().subtract(Duration(minutes: 10)),
        sentBy: otherUser.id,
        messageType: MessageType.text,
      ),
      Message(
        id: '2',
        message: 'tthe plural of the Latin word illuminatus',
        createdAt: DateTime.now().subtract(Duration(minutes: 8)),
        sentBy: otherUser.id,
        messageType: MessageType.text,
      ),
      Message(
        id: '3',
        message:
            'tthe plural of the Latin word illuminatus, meaning "enlightened"—is a name that has been in use since the late 15th century and has been applied to various groups since',
        createdAt: DateTime.now().subtract(Duration(minutes: 5)),
        sentBy: currentUser.id,
        messageType: MessageType.text,
      ),
      Message(
        id: '4',
        message: 'tthe plural of the Latin word',
        createdAt: DateTime.now().subtract(Duration(minutes: 2)),
        sentBy: currentUser.id,
        messageType: MessageType.text,
      ),
    ];
  }

  // void _onSendTap(
  //   String message,
  //   ReplyMessage? replyMessage,
  //   MessageType messageType,
  // ) {
  //   final newMessage = Message(
  //     id: DateTime.now().millisecondsSinceEpoch.toString(),
  //     message: message,
  //     createdAt: DateTime.now(),
  //     sentBy: currentUser.id,
  //     // replyMessage: replyMessage,
  //     messageType: messageType,
  //   );
  //   log("adding message");

  //   _chatController.addMessage(newMessage);
  // }

  void _onSendTap(
    String message,
    ReplyMessage? replyMessage,
    MessageType messageType,
  ) {
    final messageObj;
    if (replyMessage != null) {
      messageObj = Message(
        id: DateTime.now().toString(),
        createdAt: DateTime.now(),
        message: message,
        sentBy: _chatController.currentUser.id,
        replyMessage: replyMessage,
        messageType: messageType,
      );
    } else {
      messageObj = Message(
        id: DateTime.now().toString(),
        createdAt: DateTime.now(),
        message: message,
        sentBy: _chatController.currentUser.id,
        messageType: messageType,
      );
    }

    _chatController.addMessage(messageObj);

    Future.delayed(const Duration(milliseconds: 300), () {
      final index = _chatController.initialMessageList.indexOf(messageObj);
      _chatController.initialMessageList[index].setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      final index = _chatController.initialMessageList.indexOf(messageObj);
      _chatController.initialMessageList[index].setStatus = MessageStatus.read;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62.h + 58.w),
        child: Column(
          children: [
            SizedBox(height: 45.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CustomInnerShadowIconButton(
                    ontap: () => GoRouter.of(context).pop(),
                    height: 36.w,
                    width: 36.w,
                    iconPath: "assets/icons/common/arrow_back.svg",
                  ),
                  SizedBox(width: 16.w),
                  CircleAvatar(
                    radius: 29.w,
                    backgroundImage: NetworkImage(widget.profilePicPath),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.name,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 3.h),
                      CustomText(
                        text: "Online",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.secondaryFontColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomInnerShadowIconButton(
                    ontap: () {
                      showMenu(
                        context: context,
                        color: Color(0xFF303030),
                        position: RelativeRect.fromLTRB(
                          double.infinity,
                          36.w,
                          0,
                          double.infinity,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        items: [
                          PopupMenuItem(
                            value: 0,
                            child: CustomText(
                              text: "View contact",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: CustomText(
                              text: "Search",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: CustomText(
                              text: "Media, links and docs",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: CustomText(
                              text: "Mute notification",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          PopupMenuItem(
                            value: 4,
                            child: CustomText(
                              text: "Chat theme",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          PopupMenuItem(
                            value: 5,
                            child: CustomText(
                              text: "More",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ).then((value) {
                        if (value == 0) {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouteNames.viewContact);
                        } else if (value == 1) {}
                      });
                    },
                    height: 36.w,
                    width: 36.w,
                    iconPath: "assets/icons/common/menu_dots.svg",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 1.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white.withAlpha(0),
                    Colors.white.withAlpha(70),
                    Colors.white.withAlpha(0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ChatView(
        chatController: _chatController,

        onSendTap: _onSendTap,
        featureActiveConfig: const FeatureActiveConfig(
          lastSeenAgoBuilderVisibility: true,
          receiptsBuilderVisibility: true,
          enableScrollToBottomButton: true,
          enableOtherUserName: false,
          enableOtherUserProfileAvatar: false,
        ),

        scrollToBottomButtonConfig: ScrollToBottomButtonConfig(
          backgroundColor: Colors.orange,
          border: Border.all(
            // color: isDarkTheme ? Colors.transparent : Colors.grey,
            color: Colors.blue,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            // color: theme.themeIconColor,
            weight: 10,
            size: 30,
          ),
        ),
        chatViewState: ChatViewState.hasMessages,
        chatViewStateConfig: ChatViewStateConfiguration(
          loadingWidgetConfig: ChatViewStateWidgetConfiguration(
            loadingIndicatorColor: Colors.white,
          ),
          onReloadButtonTap: () {},
        ),

        // typeIndicatorConfig: TypeIndicatorConfiguration(
        //   flashingCircleBrightColor: theme.flashingCircleBrightColor,
        //   flashingCircleDarkColor: theme.flashingCircleDarkColor,
        // ),
        chatBackgroundConfig: ChatBackgroundConfiguration(
          messageTimeIconColor: Colors.white,
          messageTimeTextStyle: TextStyle(color: Colors.white),
          defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
            textStyle: TextStyle(color: Colors.white, fontSize: 17),
          ),
          backgroundColor: AppColors.backgroundColor,
        ),

        sendMessageBuilder: (ReplyMessage? replyMessage) {
          log(replyMessage.toString());
          final TextEditingController messageController =
              TextEditingController();
          return Builder(
            builder: (context) {
              final bottomInset = MediaQuery.of(context).viewInsets.bottom;
              final double bottomPadding = bottomInset > 0
                  ? bottomInset + 5.h
                  : 51.h;

              return Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: bottomPadding,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Reply message display
                    if (replyMessage?.message.isNotEmpty == true)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 9.h,
                        ),
                        margin: EdgeInsets.only(bottom: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 0.4.w,
                          ),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                width: 3.w,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: replyMessage!.replyTo != "1"
                                          ? widget.name
                                          : "Me",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontColor: AppColors.mainFontColor,
                                      height: 20.sp / 12.sp,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 1.h),
                                    CustomText(
                                      text: replyMessage.message,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontColor: AppColors.secondaryFontColor,
                                      height: 20.sp / 12.sp,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () =>
                                      ChatView.closeReplyMessageView(context),
                                  child: CircleAvatar(
                                    radius: 8.r,
                                    backgroundColor: AppColors.deleteColor,
                                    child: Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 14.r,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Input row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
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
                              height: 64.w,
                              width: 278.w,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 22.w, right: 22.w),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/chat/sticker.svg",
                                  ),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: 125.w,
                                    child: TextFormField(
                                      controller: messageController,
                                      decoration: InputDecoration(
                                        isCollapsed: true,
                                        border: InputBorder.none,
                                        hintText: 'Type here...',
                                        hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      onChanged: (value) {
                                        // Handle typing indicator if needed
                                        // You can implement this based on your state management
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // Handle attachment functionality
                                      // _handleAttachment();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/chat/attachment.svg",
                                    ),
                                  ),
                                  SizedBox(width: 25.w),
                                  GestureDetector(
                                    onTap: () {
                                      // Handle photo functionality
                                      // _handlePhoto();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/chat/photo.svg",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            final text = messageController.text.trim();
                            if (text.isNotEmpty) {
                              // Create message using the proper structure
                              final message = Message(
                                id: DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                                createdAt: DateTime.now(),
                                message: text,
                                sentBy: currentUser.id, // Your current user ID
                                // replyMessage: replyMessage,
                                messageType: MessageType.text,
                              );

                              // Send message - implement based on your chat controller
                              // Option 1: If using a direct method
                              // chatController.sendMessage(message);

                              // Option 2: If using state management like Bloc
                              // context.read<ChatBloc>().add(SendMessageEvent(message));

                              // Option 3: If using GetX
                              // Get.find<ChatController>().sendMessage(message);

                              // Option 4: If using Provider
                              // Provider.of<ChatProvider>(context, listen: false).sendMessage(message);

                              // Clear the text field
                              messageController.clear();

                              // Close reply message if exists - implement based on your state management
                              if (replyMessage != null) {
                                // Handle closing reply message
                              }
                            }
                          },
                          child: CustomInnerShadowIconButton(
                            height: 64.w,
                            width: 64.w,
                            iconPath: "assets/icons/chat/mic.svg",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        sendMessageConfig: SendMessageConfiguration(
          replyMessageColor: AppColors.backgroundColor,
          defaultSendButtonColor: Colors.black,
          replyDialogColor: Colors.grey[300],
          replyTitleColor: Colors.green,
          textFieldBackgroundColor: Colors.white,
          closeIconColor: Colors.red,
          textFieldConfig: TextFieldConfiguration(
            onMessageTyping: (status) {
              /// Do with status
              debugPrint(status.toString());
            },
            compositionThresholdTime: const Duration(seconds: 1),
            textStyle: TextStyle(color: Colors.black),
          ),
          micIconColor: Colors.green,
          voiceRecordingConfiguration: VoiceRecordingConfiguration(
            backgroundColor: Colors.white,
            recorderIconColor: Colors.blue,
            waveStyle: WaveStyle(
              showMiddleLine: false,
              waveColor: Colors.white,
              extendWaveform: true,
            ),
          ),
        ),
        chatBubbleConfig: ChatBubbleConfiguration(
          outgoingChatBubbleConfig: chatMessageBubble(true),
          inComingChatBubbleConfig: chatMessageBubble(false),
        ),
        replyPopupConfig: ReplyPopupConfiguration(
          backgroundColor: Colors.purple,
          buttonTextStyle: TextStyle(color: Colors.blue),
          topBorderColor: Colors.purpleAccent,
        ),
        reactionPopupConfig: ReactionPopupConfiguration(
          shadow: BoxShadow(
            // color: isDarkTheme ? Colors.black54 : Colors.grey.shade400,
            blurRadius: 20,
          ),
          // backgroundColor: theme.reactionPopupColor,
        ),
        messageConfig: MessageConfiguration(
          customMessageBuilder: (Message message) {
            final bottomInset = MediaQuery.of(context).viewInsets.bottom;
            final double bottomPadding = bottomInset > 0 ? bottomInset : 25.h;
            return Container(
              constraints: BoxConstraints(maxWidth: 299.w),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(0),
                ),
                color: Color(0xFF3D3D3D),
              ),
              child: CustomText(
                text: message.message,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 20.sp / 14.sp,
              ),
            );
          },

          messageReactionConfig: MessageReactionConfiguration(
            backgroundColor: Colors.grey,
            borderColor: Colors.grey,
            reactedUserCountTextStyle: TextStyle(color: Colors.white),
            reactionCountTextStyle: TextStyle(color: Colors.white),
            reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
              backgroundColor: Colors.cyan,
              reactedUserTextStyle: TextStyle(
                // color: theme.inComingChatBubbleTextColor,
              ),
              reactionWidgetDecoration: BoxDecoration(
                color: Colors.yellow,
                boxShadow: [
                  BoxShadow(
                    // color: isDarkTheme ? Colors.black12 : Colors.grey.shade200,
                    offset: const Offset(0, 20),
                    blurRadius: 40,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          imageMessageConfig: ImageMessageConfiguration(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            shareIconConfig: ShareIconConfiguration(
              defaultIconBackgroundColor: Colors.tealAccent,
              defaultIconColor: Colors.red,
            ),
          ),
        ),

        repliedMessageConfig: RepliedMessageConfiguration(
          backgroundColor: Color(0xFF3D3D3D),
          opacity: 0.5,
          verticalBarColor: Colors.blueGrey,
          repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
            enableHighlightRepliedMsg: true,
            highlightScale: 1.1,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(0),
          ),
          textStyle: const TextStyle(
            color: AppColors.secondaryFontColor,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          replyTitleTextStyle: TextStyle(
            color: AppColors.secondaryFontColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        swipeToReplyConfig: SwipeToReplyConfiguration(
          replyIconColor: Colors.white,
        ),
      ),
      // bottomNavigationBar: Builder(
      //   builder: (context) {
      //     final bottomInset = MediaQuery.of(context).viewInsets.bottom;
      //     final double bottomPadding = bottomInset > 0
      //         ? bottomInset + 5.h
      //         : 51.h;
      //     return Padding(
      //       padding: EdgeInsets.only(
      //         left: 20.w,
      //         right: 20.w,
      //         bottom: bottomPadding,
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           ClipRRect(
      //             borderRadius: BorderRadius.circular(50.r),
      //             child: InnerShadow(
      //               shadows: [
      //                 BoxShadow(
      //                   color: Colors.black.withAlpha(46),
      //                   offset: const Offset(-6, -6),
      //                   blurRadius: 12,
      //                 ),
      //                 BoxShadow(
      //                   color: Colors.white.withAlpha(20),
      //                   offset: const Offset(6, 6),
      //                   blurRadius: 12,
      //                 ),
      //               ],
      //               child: Container(
      //                 height: 64.w,
      //                 width: 278.w,
      //                 decoration: BoxDecoration(
      //                   color: AppColors.backgroundColor,
      //                   borderRadius: BorderRadius.circular(50.r),
      //                 ),
      //                 alignment: Alignment.center,
      //                 padding: EdgeInsets.only(left: 22.w, right: 22.w),
      //                 child: Row(
      //                   children: [
      //                     SvgPicture.asset("assets/icons/chat/sticker.svg"),
      //                     SizedBox(width: 10.w),
      //                     SizedBox(
      //                       width: 125.w,
      //                       child: TextFormField(
      //                         controller: messageTextController,
      //                         decoration: InputDecoration(
      //                           isCollapsed: true,
      //                           border: InputBorder.none,
      //                           hintText: 'Type here...',
      //                           hintStyle: TextStyle(
      //                             color: Colors.white.withOpacity(0.5),
      //                           ),
      //                         ),
      //                         style: const TextStyle(color: Colors.white),
      //                       ),
      //                     ),
      //                     const Spacer(),
      //                     SvgPicture.asset("assets/icons/chat/attachment.svg"),
      //                     SizedBox(width: 25.w),
      //                     SvgPicture.asset("assets/icons/chat/photo.svg"),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               if (messageTextController.text.trim().isNotEmpty) {
      //                 _onSendTap(
      //                   messageTextController.text.trim(),
      //                   null,
      //                   MessageType.text,
      //                 );
      //                 messageTextController.clear();
      //               }
      //             },
      //             child: CustomInnerShadowIconButton(
      //               height: 64.w,
      //               width: 64.w,
      //               iconPath: "assets/icons/chat/mic.svg",
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }

  ChatBubble chatMessageBubble(bool isOutgoingMessage) {
    return ChatBubble(
      linkPreviewConfig: LinkPreviewConfiguration(
        backgroundColor: AppColors.backgroundColor,
        bodyStyle: TextStyle(color: Colors.white),
        titleStyle: TextStyle(color: Colors.white),
      ),
      receiptsWidgetConfig: isOutgoingMessage
          ? ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all)
          : null,
      color: isOutgoingMessage
          ? AppColors.secondaryButtonColor
          : Color(0xFF3D3D3D),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
        bottomLeft: isOutgoingMessage
            ? Radius.circular(20.r)
            : Radius.circular(0),
        bottomRight: isOutgoingMessage
            ? Radius.circular(0)
            : Radius.circular(20.r),
      ),
      textStyle: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 20.sp / 14.sp,
        color: AppColors.mainFontColor,
      ),
      senderNameTextStyle: TextStyle(
        color: Colors.transparent,
        fontSize: 0,
        height: 0,
      ),
      // inComingChatBubbleTextStyle: TextStyle(color: Colors.white),
    );
  }

  void _showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }

  void receiveMessage() async {
    _chatController.addMessage(
      Message(
        id: DateTime.now().toString(),
        message: 'I will schedule the meeting.',
        createdAt: DateTime.now(),
        sentBy: '2',
      ),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    _chatController.addReplySuggestions([
      const SuggestionItemData(text: 'Thanks.'),
      const SuggestionItemData(text: 'Thank you very much.'),
      const SuggestionItemData(text: 'Great.'),
    ]);
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }
}







// Builder(
//             builder: (context) {
//               final bottomInset = MediaQuery.of(context).viewInsets.bottom;
//               final double bottomPadding = bottomInset > 0 ? bottomInset : 25.h;

//               return Padding(
//                 padding: EdgeInsets.only(
//                   left: 20.w,
//                   right: 20.w,
//                   bottom: bottomPadding,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(50.r),
//                       child: InnerShadow(
//                         shadows: [
//                           BoxShadow(
//                             color: Colors.black.withAlpha(46),
//                             offset: Offset(-6, -6),
//                             blurRadius: 12,
//                           ),
//                           BoxShadow(
//                             color: Colors.white.withAlpha(20),
//                             offset: Offset(6, 6),
//                             blurRadius: 12,
//                           ),
//                         ],
//                         child: Container(
//                           height: 64.w,
//                           width: 278.w,
//                           decoration: BoxDecoration(
//                             color: AppColors.backgroundColor,
//                             borderRadius: BorderRadius.circular(50.r),
//                           ),
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.only(left: 22.w, right: 22.w),
//                           child: Row(
//                             children: [
//                               SvgPicture.asset("assets/icons/chat/sticker.svg"),
//                               SizedBox(width: 10.w),
//                               SizedBox(
//                                 width: 125.w,
//                                 child: TextFormField(
//                                   controller: messageTextController,
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     border: InputBorder.none,
//                                     hintText: 'Type here...',
//                                     hintStyle: TextStyle(
//                                       color: Colors.white.withOpacity(0.5),
//                                     ),
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                   onFieldSubmitted: (message) {
//                                     if (message.trim().isNotEmpty) {
//                                       _onSendTap(
//                                         message,
//                                         null,
//                                         MessageType.text,
//                                       );
//                                     }
//                                   },
//                                 ),
//                               ),
//                               Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   // Handle attachment tap
//                                 },
//                                 child: SvgPicture.asset(
//                                   "assets/icons/chat/attachment.svg",
//                                 ),
//                               ),
//                               SizedBox(width: 25.w),
//                               GestureDetector(
//                                 onTap: () {
//                                   // Handle photo tap
//                                 },
//                                 child: SvgPicture.asset(
//                                   "assets/icons/chat/photo.svg",
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         final message = messageTextController.text.trim();
//                         if (message.isNotEmpty) {
//                           // onSendTap(message, null, MessageType.text);
//                         }
//                       },
//                       onLongPressStart: (details) {
//                         // onRecordingStart();
//                       },
//                       onLongPressEnd: (details) {
//                         // onRecordingStop();
//                       },
//                       child: CustomInnerShadowIconButton(
//                         height: 64.w,
//                         width: 64.w,
//                         iconPath: "assets/icons/chat/mic.svg",
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );