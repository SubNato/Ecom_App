import 'package:ecom_app/pages/course/my_courses/bloc/my_courses_blocs.dart';
import 'package:ecom_app/pages/course/my_courses/bloc/my_courses_states.dart';
import 'package:ecom_app/pages/course/my_courses/my_courses_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  late MyCoursesController _myCoursesController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _myCoursesController = MyCoursesController(context: context);
    _myCoursesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesBlocs, MyCoursesStates>(builder: (context, state){

      if(state is LoadingMyCoursesStates){
        return Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text("My Courses"),
          ),
        );
      }else{
        return const Center(child: CircularProgressIndicator(),);     //The best way to use when querying the database. It gives you the visual representation of the states changing.
      }

    });
  }
}
