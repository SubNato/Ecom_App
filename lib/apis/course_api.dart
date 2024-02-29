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

  static Future<CourseListResponseEntity> recommendedCourseList() async {
    var response = await HttpUtil().post(
        'api/recommendedCourseList'
    );

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> coursesBought() async {
    var response = await HttpUtil().post(
        'api/coursesBought'
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

  static Future<CourseListResponseEntity> search({SearchRequestEntity? params}) async {
    var response = await HttpUtil().post(
        'api/searchCourseList',               //Ensure that the name here is the same as the api name in the backend. Ensure same ENDPOINT NAMES!
        queryParameters: params?.toJson()
    );
    //print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  //For course payment
  static Future<BaseResponseEntity> coursePay({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/checkout',
      queryParameters: params?.toJson(),

    );

    return BaseResponseEntity.fromJson(response);
  }

  //For checking if an item was bought.
  static Future<BaseResponseEntity> courseBought({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/courseBought',
      queryParameters: params?.toJson(),

    );

    return BaseResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> orderList() async {
    var response = await HttpUtil().post(
        'api/orderList'
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<AuthorResponseEntity> courseAuthor(AuthorRequestEntity? params) async {
    var response = await HttpUtil().post(
        'api/courseAuthor',
      queryParameters: params!.toJson()
    );
    return AuthorResponseEntity.fromJson(response);
  }

}