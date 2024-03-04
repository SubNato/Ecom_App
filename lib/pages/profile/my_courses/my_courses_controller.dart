import 'package:ecom_app/apis/course_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/my_courses_blocs.dart';
import 'bloc/my_courses_events.dart';

class MyCoursesController {
  late BuildContext context;

  MyCoursesController({required this.context});

  //after the context is ready, this init() method gets called
  void init() {
    //we can network event or anything like that

    asyncLoadCourseData();
  }

  asyncLoadCourseData() async {

    context.read<MyCoursesBlocs>().add(const TriggerLoadingMyCoursesEvents());
    var result = await CourseAPI.courseList();
    if(result.code==200){
      if(context.mounted){
        //Save data to shared storage
        context.read<MyCoursesBlocs>().add(const TriggerLoadedMyCoursesEvents([]));
        //print(DateTime.now().toString());       //Uses the current time to show that it is being refreshed. So each time you call it, it shows the exact time as proof.
        Future.delayed(const Duration(milliseconds: 10), (){
          context.read<MyCoursesBlocs>().add(const TriggerDoneLoadingMyCoursesEvents());     // It occurs so fast that you don't see the changes in the UI. So we slow it down a bit to see the changes reflected on the UI Frontend.
        });
      }//So you delay an event, especially when the events happen one after another.
    }
  }
}

/*Future.delayed(Duration(seconds: 3), (){
      //Here the loading is done
      //Here we can do api requests
      context.read<MyCoursesBlocs>().add(TriggerLoadingMyCoursesEvents());
      print("Loading Done");
    });*/
