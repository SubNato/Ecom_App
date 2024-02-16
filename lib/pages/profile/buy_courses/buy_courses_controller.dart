import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../apis/course_api.dart';
import 'bloc/buy_courses_blocs.dart';
import 'bloc/buy_courses_events.dart';

class BuyCoursesController{
  late BuildContext context;

  BuyCoursesController({required this.context});

  //after the context is ready, this init() method gets called
  void init() {
    //we can network event or anything like that

    asyncLoadBuyCourseData();
  }

  asyncLoadBuyCourseData() async {

    context.read<BuyCoursesBlocs>().add(const TriggerLoadingBuyCoursesEvents());
    var result = await CourseAPI.coursesBought();
    if(result.code==200){
      if(context.mounted){
        context.read<BuyCoursesBlocs>().add(const TriggerDoneLoadingBuyCoursesEvents());     // It occurs so fast that you don't see the changes in the UI. So we slow it down a bit to see the changes reflected on the UI Frontend.

        //print(DateTime.now().toString());       //Uses the current time to show that it is being refreshed. So each time you call it, it shows the exact time as proof.
        Future.delayed(const Duration(milliseconds: 10), (){
          //Save data to shared storage
          context.read<BuyCoursesBlocs>().add(TriggerLoadedBuyCoursesEvents(result.data!));

        });
      }//So you delay an event, especially when the events happen one after another.
    }
  }
}