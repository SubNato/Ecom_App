import 'package:ecom_app/pages/course/lesson/bloc/lesson_blocs.dart';
import 'package:ecom_app/pages/course/lesson/bloc/lesson_events.dart';
import 'package:ecom_app/pages/course/lesson/bloc/lesson_states.dart';
import 'package:ecom_app/widgets/base_text_widget.dart';
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
  void didChangeDependencies(){
    super.didChangeDependencies();
    _lessonController = LessonController(context: context);
    context.read<LessonBlocs>().add(TriggerUrlItem(null));
    _lessonController.init();
  }
  @override
  void dispose(){
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBlocs, LessonStates>(builder: (context, state){
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
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: 325.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/icons/video.png"
                                  ),
                                  fit: BoxFit.fitWidth
                                ),
                                borderRadius: BorderRadius.circular(20.h)
                              ),
                              child: FutureBuilder(
                                future: state.initializeVideoPlayerFuture,
                                builder: (context, snapshot){     //Snapshot is the incoming data, and can be named anything.
                                  //Check to see if the connection is made to the certain video on the server.
                                    if(snapshot.connectionState==ConnectionState.done){
                                      return _lessonController.videoPlayerController==null?Container():AspectRatio(
                                        aspectRatio: _lessonController.videoPlayerController!.value.aspectRatio,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            VideoPlayer(_lessonController.videoPlayerController!),
                                            VideoProgressIndicator(_lessonController.videoPlayerController!, allowScrubbing: true,
                                            colors: VideoProgressColors(playedColor: AppColors.primaryElement),
                                            )
                                          ],
                                        ),
                                      );
                                    }else{
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      );
    });
  }
}
