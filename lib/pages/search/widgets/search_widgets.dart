import 'package:ecom_app/pages/search/bloc/search_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecom_app/widgets/base_text_widget.dart' as reuse;

import '../../../entities/values/colors.dart';
import '../../../entities/values/constant.dart';
import '../../../routes/names.dart';

Widget searchList(SearchStates state){
  return ListView.builder(
      shrinkWrap: true,
      itemCount: state.courseItem.length,
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
              Navigator.of(context).pushNamed(AppRoutes.COURSE_DETAIL, arguments: {
                "id":state.courseItem[index].id
              });
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
                              fit: BoxFit.fitHeight,      //Be careful when using AppConstants and differentiating between SERVER_UPLOADS and SERVER_API_URL. Totally different uses for different places in code!
                              image: NetworkImage("${AppConstants.SERVER_UPLOADS}${state.courseItem[index].thumbnail!}"))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //List Item Title
                        reuse.listItemContainer(state.courseItem[index].name.toString()),
                        //List Item Description
                        reuse.listItemContainer(
                            "${state.courseItem[index].lesson_num} lessons",
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
      });
}