import 'package:ecom_app/apis/lesson_api.dart';
import 'package:ecom_app/entities/entities.dart';
import 'package:ecom_app/pages/course/lesson/bloc/lesson_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'bloc/lesson_blocs.dart';

class LessonController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;

  LessonController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    //set the earlier videos to false meaning, stop playing!
    context.read<LessonBlocs>().add(TriggerPlay(false));
    await asyncLoadLessonData(args['id']);
  }
  Future<void> asyncLoadLessonData(int? id)async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonAPI.lessonDetail(params: lessonRequestEntity);
    if(result.code==200){
      if(context.mounted){
        context.read<LessonBlocs>().add(TriggerLessonVideo(result.data!));
        if(result.data!.isNotEmpty){
          var url = result.data!.elementAt(0).url;
          //This url is important for init (initialization) video player.
          videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url!));     //To parse the URL so that it works with teh 'networkUrl' function!
          //Here actually stream starts to happen.
          var initPlayer = videoPlayerController?.initialize();
          context.read<LessonBlocs>().add(TriggerUrlItem(initPlayer));
        }
      }
    }

  }

  void playVideo(String url){
    if(videoPlayerController!=null){
      videoPlayerController?.pause();
      videoPlayerController?.dispose();  //Do these two to prevent any memory leakage if the video player exists. Pause it and dispose it.
    }
    videoPlayerController = VideoPlayerController.networkUrl( Uri.parse(url) );     //You have to parse the Url to get it to work with the networkUrl function in all circumstances.
    context.read<LessonBlocs>().add(const TriggerPlay(false));
    context.read<LessonBlocs>().add(const TriggerUrlItem(null));
    var initPlayer =
        videoPlayerController?.initialize().then((value){
          videoPlayerController?.seekTo(const Duration(milliseconds: 0));
        });
    context.read<LessonBlocs>().add(TriggerUrlItem(initPlayer));
    context.read<LessonBlocs>().add(const TriggerPlay(true));
    videoPlayerController?.play();
  }

}


//Remember that your domainname in the future must have "Https" to work, a secure browser or else it just might not work.