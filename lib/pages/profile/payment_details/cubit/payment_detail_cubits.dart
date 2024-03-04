import 'package:ecom_app/pages/profile/payment_details/cubit/payment_detail_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../entities/course.dart';

class PaymentDetailCubits extends Cubit<PaymentDetailStates>{      // A function in the Bloc class of constructors.
  PaymentDetailCubits():super(InitialPaymentDetailStates());

  void historyPaymentDetails(List<CourseItem> courseItem){
    print('----- Here we are emitting states of history');
    emit(HistoryPaymentDetailStates(courseItem));
  }
  void loadingPaymentDetails(){
    print('----- Here we are emitting loading states of history');
    emit(LoadingPaymentDetailStates());
  }
  void doneLoadingPaymentDetails(){
    print('----- Here we are emitting done loading states of history');
    emit(DoneLoadingPaymentDetailStates());
  }
}