import 'package:ecom_app/entities/entities.dart';
import 'package:ecom_app/pages/course/lesson/bloc/lesson_blocs.dart';
import 'package:ecom_app/pages/course/lesson/bloc/lesson_events.dart';
import 'package:ecom_app/pages/course/lesson/bloc/lesson_states.dart';
import 'package:ecom_app/pages/course/lesson/widgets/lesson_detail_widgets.dart';
import 'package:ecom_app/widgets/base_text_widget.dart';
import 'package:ecom_app/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../entities/values/colors.dart';
import 'lesson_controller.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;
  int videoIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lessonController = LessonController(context: context);
    context.read<LessonBlocs>().add(const TriggerUrlItem(null));
    context.read<LessonBlocs>().add(const TriggerVideoIndex(0));
    _lessonController.init();
  }

  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBlocs, LessonStates>(builder: (context, state) {
      return SafeArea(
        child: Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Lesson Detail"),
              body: CustomScrollView(
                slivers: [
                  SliverPadding(padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 25.w
                  ),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          //Video preview
                          videoPlayer(state, _lessonController),
                          //video buttons
                          videoControls(state, _lessonController, context)
                        ],
                      ),
                    ),
                  ),
                  videoList(state, _lessonController),
                ],
              ),
            )
        ),
      );
    });
  }

}

