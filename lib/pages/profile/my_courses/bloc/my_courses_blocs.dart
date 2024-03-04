import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_courses_events.dart';
import 'my_courses_states.dart';

class MyCoursesBlocs extends Bloc<MyCoursesEvents, MyCoursesStates>{
  MyCoursesBlocs():super(const InitialMyCoursesStates()){
    on<TriggerInitialMyCoursesEvents>(_triggerInitialMyCoursesEvents);
    on<TriggerLoadingMyCoursesEvents>(_triggerLoadingMyCourses);
    on<TriggerLoadedMyCoursesEvents>(_triggerLoadedMyCourses);
    on<TriggerDoneLoadingMyCoursesEvents>(_triggerDoneLoadingMyCourses);
  }

  _triggerInitialMyCoursesEvents(TriggerInitialMyCoursesEvents event, Emitter<MyCoursesStates> emit){
    print('Initial.....');     //This does not get printed because we are not waiting for anything to be triggered. We are simply emitting a state/ or simply calling the state.
    emit(InitialMyCoursesStates());
  }

  _triggerLoadedMyCourses(TriggerLoadedMyCoursesEvents event, Emitter<MyCoursesStates> emit){
    print('loaded.....');
      emit(LoadedMyCoursesStates(event.courseItem));
  }
                    //The 2 below classes/ methods acts like a switch to turn on or off the states directly
  _triggerLoadingMyCourses(TriggerLoadingMyCoursesEvents event, Emitter<MyCoursesStates> emit){
    //We are calling state classes directly. State classes are similar to state properties,
    //we have seen with state.copyWith() method previously
    print('loading.......');
    emit( const LoadingMyCoursesStates());
  }

  _triggerDoneLoadingMyCourses(TriggerDoneLoadingMyCoursesEvents event, Emitter<MyCoursesStates> emit){
    //We are calling state classes directly. State classes are similar to state properties,
    //we have seen with state.copyWith() method previously
    print('done......');
    emit( const DoneLoadingMyCoursesStates());
  }

}