import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget settingsButton(BuildContext context, void Function()? func){
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Confirm Logout"),
          actions: [
            TextButton(         //We use ()=>, because it is a function. This is because the function is being executed in the call back function "onPressed ()=>".
                onPressed: ()=>Navigator.of(context).pop(), child: const Text("Cancel")
            ),
            TextButton(
                onPressed: func,
                child: const Text("Confirm")
            )
          ],
        );
      });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage(
                  "assets/icons/Logout.png"
              )
          )
      ),
    ),
  );
}