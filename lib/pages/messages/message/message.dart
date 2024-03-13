import 'package:ecom_app/entities/values/colors.dart';
import 'package:ecom_app/pages/messages/message/cubit/message_cubits.dart';
import 'package:ecom_app/pages/messages/message/cubit/message_states.dart';
import 'package:ecom_app/pages/messages/message/message_controller.dart';
import 'package:ecom_app/pages/messages/message/widgets/message_widgets.dart';
import 'package:ecom_app/widgets/base_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late MessagesController _messagesController;

  @override
  void didChangeDependencies() {
    _messagesController = MessagesController(context: context);
    _messagesController.init();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocBuilder<MessageCubits, MessageStates>(builder: (context, state) {

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Messages"),
            body: state.loadStatus==true?const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryElement,
              ),
            ):CustomScrollView(
              slivers: [
                SliverPadding(padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
                  sliver: SliverList(     //We need SliverLists because we are going to show our lists of chats!
                    delegate: SliverChildBuilderDelegate(
                            (context, index){     //The underscore just means that its not useful, So we don't enter any values there. Basically we skip the values.
                          var item = state.message.elementAt(index);
                          return buildChatList(context, item, _messagesController);
                        },
                        childCount: state.message.length
                    ),
                  ),
                )
              ],
            ),
          );
        })
        ,),
    );
  }
}
