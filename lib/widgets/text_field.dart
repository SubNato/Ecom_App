import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../entities/values/colors.dart';

Widget appTextField(String hintText, String textType,
    void Function(String value)?  func, {int? maxLines=1, TextEditingController? controller}){
  return TextField(
    controller: controller,
    onChanged: (value)=>func!(value),          //To add a value to the function NAMED 'func' that is not null (!)
    keyboardType: TextInputType.multiline,
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText:hintText ,
      border: const OutlineInputBorder(
          borderSide: BorderSide(          //To fix/edit the borders to let it look great!
              color: Colors.transparent
          )
      ),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent
          )
      ),
      disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent
          )
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent
          )
      ),
      hintStyle: const TextStyle(
          color: AppColors.primarySecondaryElementText
      ),

    ),
    style: TextStyle(
        color: AppColors.primaryText  ,
        fontFamily: "Avenir",
        fontWeight: FontWeight.normal,
        fontSize: 14.sp
    ),
    autocorrect: false,
    obscureText: textType == "password"?true:false,
  );
}