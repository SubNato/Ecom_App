import 'package:ecom_app/pages/course/my_courses/bloc/my_courses_blocs.dart';
import 'package:ecom_app/pages/course/my_courses/bloc/my_courses_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesController{
  late BuildContext context;
  MyCoursesController({required this.context});

  //after the context is ready, this init() method gets called
  void init(){
    //we can network event or anything like that
    Future.delayed(Duration(seconds: 3), (){
      //Here the loading is done
      //Here we can do api requests
      context.read<MyCoursesBlocs>().add(TriggerLoadingMyCoursesEvents());
      print("Loading Done");
    });
  }
}