import 'package:ecom_app/entities/entities.dart';
import 'package:flutter/cupertino.dart';

import '../../global.dart';

class HomeController{
  final BuildContext context;
  UserItem? userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});


  void init(){     //Used to ensure that the user is logged in and then makes an api call.
    print("...home contrroller init method...");
    }
}