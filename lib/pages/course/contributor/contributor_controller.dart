import 'dart:convert';

import 'package:ecom_app/apis/course_api.dart';
import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/pages/course/contributor/cubit/contributor_cubits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContributorController{
  late BuildContext context;
  ContributorController({required this.context});

  void init(){
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadAuthorData(args['token']);
  }

  Future<void> asyncLoadAuthorData(String token) async {
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity();
    authorRequestEntity.token = token;
    var result = await CourseAPI.courseAuthor(authorRequestEntity);
    if(result.code == 200){
      if(context.mounted){
        context.read<ContributorCubits>().triggerContributor(result.data!);
        var res = jsonEncode(context.read<ContributorCubits>().state.authorItem);
        print("My author is ${res}");
      }
    }

  }

}