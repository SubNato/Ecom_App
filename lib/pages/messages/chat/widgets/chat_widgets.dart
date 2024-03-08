import 'package:ecom_app/entities/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../entities/values/colors.dart';

Widget chatFileButtons(String iconPath){
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(10.w),
      child: Image.asset(iconPath),
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(40.w),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(1, 1)
            )
          ]
      ),
    ),
  );
}

Widget chatWidget(Msgcontent item){
  return Container(
    padding: EdgeInsets.only(top: 10.w, bottom: 10.w, left: 20.w, right: 0.w),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(constraints: BoxConstraints(
          maxWidth: 250.w,
          minHeight: 40.w,
        ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 0.w, top: 0.w),
                padding: EdgeInsets.only(top: 10.w, bottom: 10.w, left: 10.w, right: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0.w),
                    topLeft: Radius.circular(20.w),
                    bottomLeft: Radius.circular(20.w),
                    bottomRight: Radius.circular(20.w)
                  ),
                  
                ),
                child: Text("${item.content}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryElementText,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}