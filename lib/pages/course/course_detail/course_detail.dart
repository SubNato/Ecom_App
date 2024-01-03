import 'package:ecom_app/entities/values/colors.dart';
import 'package:ecom_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:ecom_app/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:ecom_app/pages/course/course_detail/course_detail_controller.dart';
import 'package:ecom_app/pages/course/widgets/course_detail_widgets.dart';
import 'package:ecom_app/widgets/base_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'course_detail_controller.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
  @override
  void initState(){
    super.initState();

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailStates>(
        builder: (context, state){


          return state.courseItem==null?const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightGreen,
            ),
          ):Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //First big image.
                            thumbnail(state.courseItem!.thumbnail.toString()),
                            SizedBox(height: 15.h,),
                            //Three buttons or menus
                            menuView(),
                            SizedBox(height: 15.h,),
                            //Course Description title
                            reusableText("Course Description"),
                            SizedBox(height: 15.h,),
                            //Course Description
                            descriptionText(state.courseItem!.description.toString()),
                            SizedBox(height: 20.h,),
                            //Course Buy Button
                            GestureDetector(
                              onTap: (){
                                _courseDetailController.goBuy(state.courseItem!.id);
                              },
                              child: buyButton("Go Buy!"),
                            ),
                            SizedBox(height: 20.h,),
                            //Course summary title
                            courseSummaryTitle(),
                            //Course summary in list
                            courseSummaryView(context, state),
                            SizedBox(height: 20.h,),
                            //Lesson list title
                            reusableText("Lesson List"),
                            SizedBox(height: 20.h,),
                            //Course Lesson List
                            courseLessonList(),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
