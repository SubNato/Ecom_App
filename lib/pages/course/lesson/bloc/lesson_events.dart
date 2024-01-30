import '../../../../entities/lesson.dart';

abstract class LessonEvents{
  const LessonEvents();
}

class TriggerLessonVideo extends LessonEvents{
  const TriggerLessonVideo(this.lessonVideoItem);
  final List<LessonVideoItem> lessonVideoItem;
  @override
  List<Object?> get props =>[lessonVideoItem];     //Needed in them?
}

class TriggerUrlItem extends LessonEvents{
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem(this.initVideoPlayerFuture);
  @override
  List<Object?> get props => [initVideoPlayerFuture];
}

class TriggerPlay extends LessonEvents{
  final bool isPlay;
  const TriggerPlay(this.isPlay);
  @override
  List<Object?> get props =>[isPlay];
}