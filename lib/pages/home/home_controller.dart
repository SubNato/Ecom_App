import 'package:ecom_app/entities/entities.dart';
import 'package:ecom_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ecom_app/pages/home/bloc/home_page_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../apis/course_api.dart';
import '../../global.dart';

class HomeController{
  late BuildContext context;
  UserItem? get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._external();  //Makes it a private constructor, adding a name to it.

  HomeController._external();

  //This is a factory constructor.
  //This ensures that you have the original/only one instance!
  factory HomeController({required BuildContext context}){
    _singleton.context = context;
    return _singleton;
  }


  Future<void> init() async {
    //Used to ensure that the user is logged in and then makes an api call.
    if(Global.storageService.getUserToken().isNotEmpty){
      var result = await CourseAPI.courseList();
      print("the result is ${(result.data![0].thumbnail!)}");
      if(result.code ==200){

        if(context.mounted){ //Makes sure that  the context is still there and is mounted.
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }

        //print(result.data![1].description);     //In Dart, they do not use Arrays, they use Lists. So '[]' denotes a list with the index of the list you want to call, similar to an array! But it is not an array.
      }else{
        print(result.code);
      }
    }else{
      print("User has already logged out");
    }

  }
}