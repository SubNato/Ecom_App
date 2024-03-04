import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/pages/course/contributor/cubit/contributor_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContributorCubits extends Cubit<ContributorStates>{
  ContributorCubits():super(const ContributorStates());     //Then register your methods when using Cubits

  triggerContributor(AuthorItem event){
    emit(state.copyWith(authorItem: event));
  }

  triggerCourseItemChange(List<CourseItem> event){
    emit(state.copyWith(courseItem: event));
  }
}