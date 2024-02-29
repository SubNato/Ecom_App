import 'package:ecom_app/apis/course_api.dart';
import 'package:ecom_app/apis/lesson_api.dart';
import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/entities/entities.dart';
import 'package:ecom_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:ecom_app/pages/course/course_detail/bloc/course_detail_events.dart';
import 'package:ecom_app/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../routes/names.dart';

class CourseDetailController{
  final BuildContext context;

  CourseDetailController({required this.context});

  void init() async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadCourseData(args["id"]);
    asyncLoadLessonData(args["id"]);
    asyncLoadCourseBought(args["id"]);
  }

  asyncLoadCourseData(int? id)async{
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);

    if(result.code == 200){
      if(context.mounted){
        print("---------------Context is ready--------------------");
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      }else{
        print("---------Context is not available-----------");
      }

    }else{
      toastInfo(msg: "Something went wrong, check the log in your Laravel.log file!");
      print("--------------------Error Code ${result.code}---------------");
    }
  }

  asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonAPI.lessonList(params:lessonRequestEntity);
    //print('--------- My Lesson Data ${result.data?.length.toString()}-----------');
    if(result.code == 200){
      if(context.mounted){
        context.read<CourseDetailBloc>().add(TriggerLessonList(result.data!));
      }else{
        print("----- Context is not ready------");
      }
    }else{
      toastInfo(msg: "Something went wrong, check the log!");
    }

  }




  Future<void> goBuy(int? id) async {

    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if(result.code == 200){
      //This gives you a cleaner format of URL!
      var url = Uri.decodeFull(result.data!);
      //To make it a variable.
      var res = await Navigator.of(context).pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {     //This pushes the page to the screen that you want. As a next page. So you would return here after/if you 'pop' the stack or page.
        "url":url
      });

      if(res == "success"){
        toastInfo(msg: result.msg!);
      }
      //print("----- My returned STRIPE URL is $url-------");
    }else{
      toastInfo(msg: result.msg!);
    }
  }

  Future<void> asyncLoadCourseBought(int? id)async {

    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseBought(params: courseRequestEntity);
    if(result.code == 200){
      if(result.msg == "success"){
        if(context.mounted){
          context.read<CourseDetailBloc>().add(const TriggerCheckBuy(true));
        }
      }else{
        if(context.mounted){
          context.read<CourseDetailBloc>().add(const TriggerCheckBuy(false));
        }
      }
    }
  }

}