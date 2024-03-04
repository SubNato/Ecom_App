import 'package:ecom_app/routes/names.dart';
import 'package:ecom_app/widgets/image_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../entities/values/colors.dart';
import '../../../../entities/values/constant.dart';
import '../../../../widgets/base_text_widget.dart';
import '../cubit/contributor_states.dart';

Widget backgroundImage() {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: const DecorationImage(
            image: AssetImage(
                "assets/icons/background.png" //This is a very beautiful image!
                ))),
  );
}

Widget authorView(BuildContext context, ContributorStates state) {
  return Container(
    width: 325.w,
    margin: EdgeInsets.only(left: 20.w, bottom: 1.w),
    child: state.authorItem == null
        ? Container()
        : Row(
            //If the state object is null then do an empty container, ELSE you use the row.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Author's profile photo
              cachedNetworkImage(
                state.authorItem!.avatar??"",
                width: 80.w,
                height: 80.h,
                defaultImage: "assets/icons/person_1.png"
              ),
              //Author's bio
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  //Author's name
                  Container(
                    margin: EdgeInsets.only(left: 6.w, bottom: 8.h),
                    child: reusableText(state.authorItem?.name ?? "Unknown",
                        color: AppColors.primaryText, fontSize: 13),
                  ),
                  //Author's job
                  Container(
                    margin: EdgeInsets.only(left: 6.w, bottom: 8.h),
                    child: reusableText(state.authorItem?.job ?? "Instructor",
                        color: AppColors.primarySecondaryElementText,
                        fontSize: 9,
                        fontWeight: FontWeight.normal),
                  ),
                  //Author's popularity
                  authorsPopularity(),
                ],
              )
            ],
          ),
  );
}

Widget authorsPopularity() {
  return Row(
    children: [
      //Author's fans
      _iconAndNum("assets/icons/people.png", 121),
      SizedBox(
        width: 5.w,
      ), //To create space between the icons placed there.
      _iconAndNum("assets/icons/star.png", 12),
      SizedBox(
        width: 5.w,
      ),
      _iconAndNum("assets/icons/download.png", 102),
    ],
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    //margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 16.w,
          height: 16.h,
        ),
        reusableText(num.toString(),
            color: AppColors.primaryThirdElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}

Widget authorsDescription(ContributorStates state){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //About Me Text
      reusableText("About Me", color: AppColors.primaryText, ),
      //About author's description.       //Here we have to wait for server/ api response cause it takes time. If we didn't it would cause an error or possibly crash. So we wait for a response as shown below.
      state.authorItem==null?Container(): reusableText(state.authorItem!.description??"No Description Found",
        color: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 11.sp,
      ),
    ],
  );
}

Widget authorCourseList(ContributorStates state) {
  return SingleChildScrollView(

    child: ListView.builder(
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
                    Navigator.of(context).pushNamed(AppRoutes.COURSE_DETAIL,
                      arguments: {
                      "id":state.courseItem[index].id
                      }
                    );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //For image and the text
                  Row(
                    children: [
                      cachedNetworkImage("${AppConstants.SERVER_UPLOADS}${state.courseItem[index].thumbnail!}",
                      width: 60.w,
                        height:  60.h,
                        defaultImage: "assets/icons/image_1.png"
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //List Item Title
                          listItemContainer(state.courseItem[index].name.toString()),
                          //List Item Description
                          listItemContainer(
                              state.courseItem[index].description.toString(),
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







