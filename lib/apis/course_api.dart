import 'package:ecom_app/entities/base.dart';
import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList'
    );

    return CourseListResponseEntity.fromJson(response);
  }
  static Future<CourseDetailResponseEntity> courseDetail({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
        'api/courseDetail',
      queryParameters: params?.toJson()
    );
    //print(response.toString());
    return CourseDetailResponseEntity.fromJson(response);
  }

  //For course payment
  static Future<BaseResponseEntity> coursePay({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/checkout',
      queryParameters: params?.toJson(),

    );

    return BaseResponseEntity.fromJson(response);
  }
}