import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList'
    );
    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }
}