import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/entities/values/colors.dart';
import 'package:ecom_app/entities/values/constant.dart';
import 'package:ecom_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ecom_app/pages/home/bloc/home_page_events.dart';
import 'package:ecom_app/pages/home/bloc/home_page_states.dart';
import 'package:ecom_app/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/base_text_widget.dart';

AppBar buildAppBar(String avatar) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "${AppConstants.SERVER_API_URL}$avatar"))),
            ),
          )
        ],
      ),
    ),
  );
}

//This is a reusable big text widget
Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
          color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

//For the slider view
Widget slidersView(BuildContext context, HomePageStates states) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: states.index, //Make this dynamic. Do this with Bloc.
          decorator: DotsDecorator(
              color: AppColors.primaryThirdElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
              )
          ),
        ),
      )
    ],
  );
}

//Sliders widget
Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(path)
        )
    ),
  );
}

//Menu view for showing items.
Widget menuView() {
  return Column(
    children: [
      Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              reusableText("Choose your course"),
              GestureDetector(child: reusableText(
                  "See all", color: AppColors.primaryThirdElementText,
                  fontSize: 10))
            ],
          )
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText(
                "Popular", textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
            _reusableMenuText(
                "Newest", textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}


//For the menu buttons, reusable text
Widget _reusableMenuText(String menuText, {Color textColor = AppColors
    .primaryElementText, Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backGroundColor)
    ),
    padding: EdgeInsets.only(
        left: 15.w, right: 15.w, top: 5.h, bottom: 5.h
    ),
    child: reusableText(menuText, color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: 11),
  );
}

//For course grid view ui
Widget courseGrid(CourseItem item) {
  return cachedNetworkImage(
      AppConstants.SERVER_UPLOADS + item.thumbnail!, child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(AppConstants.SERVER_UPLOADS + item.thumbnail!)
            )
        ),
          child: Column( //For the text in the image coming from the network backend.
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: false,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(height: 5.h,),
              Text(
                item.description ?? "",
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: false,
                style: TextStyle(
                  color: AppColors.primaryFourthElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: 8.sp,
                ),
              )
            ],
          ),
  ),
    defaultImage: "assets/icons/image.png"
  );
}