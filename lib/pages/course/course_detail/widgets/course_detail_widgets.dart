import 'package:ecom_app/entities/values/constant.dart';
import 'package:ecom_app/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:ecom_app/routes/names.dart';
import 'package:ecom_app/widgets/base_text_widget.dart';
import 'package:ecom_app/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../entities/values/colors.dart';



Widget thumbnail(String thumbnail) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage("${AppConstants.SERVER_UPLOADS}$thumbnail"))),
  );
}

Widget menuView(BuildContext context, CourseDetailStates state) {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.CONTRIBUTOR,
            //This token to verify the person's identity to whom you are talking to in chat.
                //This is the course creator's token.
            arguments: {
              "token": state.courseItem!.user_token
            }
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(7.w),
                border: Border.all(color: AppColors.primaryElement)),
            child: reusableText(
              "Author Page",
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
            ),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 0),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusableText(num.toString(),
            color: AppColors.primaryThirdElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}

Widget descriptionText(String description) {
  return reusableText(
      description,
      color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.normal,
      fontSize: 11.sp);
}

Widget courseSummaryTitle() {
  return reusableText("The Course Includes", fontSize: 14.sp);
}

Widget courseSummaryView(BuildContext context, CourseDetailStates state) {
  var imagesInfo = <String, String>{
    //Mapping. Makes it easier, and you don't have to copy and paste over and over again. #Learned something new, Thank God!
    "${state.courseItem!.video_len??"0"} Hours Video": "video_detail.png",
    "Total ${state.courseItem!.lesson_num??"0"} Lessons": "file_detail.png",
    "${state.courseItem!.down_num??"0"} Downloadable Resources": "download_detail.png",  //This is not there as yet.
  };
  return Column(
    children: [
      //Spread Operator:
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => null, // ()=> is the same as (){ }.
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                    "assets/icons/${imagesInfo.values.elementAt(index)}",
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(imagesInfo.keys.elementAt(index),
                    style: TextStyle(
                        color: AppColors.primarySecondaryElementText,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp)),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget courseLessonList(CourseDetailStates state) {
  return SingleChildScrollView(

    child: ListView.builder(
      shrinkWrap: true,
        itemCount: state.lessonItem.length,
        itemBuilder: (context, index){
      return Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 325.w,
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10.w),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1))
            ]),
        child: InkWell(
          onTap: () {
            if(state.checkBuy == true){
              Navigator.of(context).pushNamed(AppRoutes.LESSON_DETAIL, arguments: {
                "id":state.lessonItem[index].id
              });
            }else{
              toastInfo(msg: "Please buy this course to view");
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //For image and the text
              Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h),
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,     //Maybe just state.lessonItem[index].thumbnail! could work below?.
                            image: NetworkImage("${AppConstants.SERVER_API_URL}${state.lessonItem[index].thumbnail!}"))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //List Item Title
                      listItemContainer(state.lessonItem[index].name.toString()),
                      //List Item Description
                      listItemContainer(
                        state.lessonItem[index].description.toString(),
                          fontSize: 10,
                          color: AppColors.primaryThirdElementText,
                          fontWeight: FontWeight.normal),
                    ],
                  )
                ],
              ),

              //For showing the right arrow
              Container(
                child: Image(
                  height: 24.h,
                  width: 24.h,
                  image: AssetImage("assets/icons/arrow_right.png"),
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}

