import '../../../../entities/course.dart';

abstract class MyCoursesStates {
  const MyCoursesStates();
}

class LoadingMyCoursesStates extends MyCoursesStates{
  const LoadingMyCoursesStates();
}

class LoadedMyCoursesStates extends MyCoursesStates{
  const LoadedMyCoursesStates(this.courseItem);
  final List<CourseItem> courseItem;
}