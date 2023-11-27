import 'package:ecom_app/entities/entities.dart';

import '../utils/http_util.dart';

class UserAPI{
  static login({LoginRequestEntity? params}) async {
    //Response = response.data after the post method returns.
    var response = await HttpUtil().post(
      'api/login',
      queryParameters:params?.toJson()
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}