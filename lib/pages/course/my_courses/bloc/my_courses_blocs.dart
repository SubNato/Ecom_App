import 'package:ecom_app/pages/course/my_courses/bloc/my_courses_events.dart';
import 'package:ecom_app/pages/course/my_courses/bloc/my_courses_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesBlocs extends Bloc<MyCoursesEvents, MyCoursesStates>{
  MyCoursesBlocs():super(LoadedMyCoursesStates([])){
    on<TriggerLoadedMyCoursesEvents>(_triggerLoadedMyCourses);
    on<TriggerLoadingMyCoursesEvents>(_triggerLoadingMyCourses);
  }

  _triggerLoadedMyCourses(TriggerLoadedMyCoursesEvents event, Emitter<MyCoursesStates> emit){

  }

  _triggerLoadingMyCourses(TriggerLoadingMyCoursesEvents event, Emitter<MyCoursesStates> emit){
    //We are calling state classes directly. State classes are similar to state properties,
    //we have seen with state.copyWith() method previously
    emit(const LoadingMyCoursesStates());
  }


}