import 'package:ecom_app/apis/course_api.dart';
import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:ecom_app/pages/course/course_detail/bloc/course_detail_events.dart';
import 'package:ecom_app/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CourseDetailController{
  final BuildContext context;

  CourseDetailController({required this.context});

  void init() async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id)async{
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
      toastInfo(msg: "Something went wrong");
      print("--------------------Error Code ${result.code}---------------");
    }
  }

  Future<void> goBuy(int? id) async {
    print("--------- Course ID is ${id}--------");
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
      print("----- My returned STRIPE URL is ${result.data!}-------");
      print("----- My returned STRIPE URL is $url-------");
    }else{
      print("----- Failed Payment------");
    }
  }
}