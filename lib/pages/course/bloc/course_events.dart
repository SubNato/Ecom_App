import 'package:ecom_app/entities/course.dart';

abstract class CourseEvents{
  const CourseEvents();
}

class TriggerCourse extends CourseEvents{
  const TriggerCourse(this.courseItem):super();
  final CourseItem courseItem;
}