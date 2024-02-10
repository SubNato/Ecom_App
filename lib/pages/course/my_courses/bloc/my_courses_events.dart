import '../../../../entities/course.dart';
//For each state we are using a different class
//So that we can check our state type
abstract class MyCoursesEvents {
  const MyCoursesEvents();
}

class TriggerLoadingMyCoursesEvents extends MyCoursesEvents{
  const TriggerLoadingMyCoursesEvents();
}

class TriggerLoadedMyCoursesEvents extends MyCoursesEvents{
  const TriggerLoadedMyCoursesEvents(this.courseItem);
  final List<CourseItem> courseItem;
}