import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../apis/course_api.dart';
import 'cubit/payment_detail_cubits.dart';

//We use this class so that fresh instances of the cubit (in this case) or (usually) the bloc gets injected into the system/ code constantly
//This is so that the old instances don't remain, and that it is constantly refreshed!

class PaymentDetailsController{
  late BuildContext context;

  PaymentDetailsController({required this.context});

  //after the context is ready, this init() method gets called
  void init() {
    //we can network event or anything like that

    asyncLoadBuyCourseData();
  }

  asyncLoadBuyCourseData() async {

    context.read<PaymentDetailCubits>().loadingPaymentDetails();
    var result = await CourseAPI.orderList();
    if(result.code==200){
      if(context.mounted){
        context.read<PaymentDetailCubits>().doneLoadingPaymentDetails();     // It occurs so fast that you don't see the changes in the UI. So we slow it down a bit to see the changes reflected on the UI Frontend.

        Future.delayed(const Duration(milliseconds: 10), (){
          print(DateTime.now().toString());
          context.read<PaymentDetailCubits>().historyPaymentDetails(result.data!);

        });
      }//So you delay an event, especially when the events happen one after another.
    }
  }
}