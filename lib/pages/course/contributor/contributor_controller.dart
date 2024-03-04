import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/apis/course_api.dart';
import 'package:ecom_app/entities/course.dart';
import 'package:ecom_app/entities/entities.dart';
import 'package:ecom_app/global.dart';
import 'package:ecom_app/pages/course/contributor/cubit/contributor_cubits.dart';
import 'package:ecom_app/routes/names.dart';
import 'package:ecom_app/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContributorController {
  late BuildContext context;

  ContributorController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();
  var db = FirebaseFirestore
      .instance; //cloud firestore     //A package that we added. From firebase. Its a firebase database reference.

  void init() {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadAuthorData(args['token']);
    asyncLoadAuthorCourseData(args['token']);
  }

  Future<void> goChat(AuthorItem author) async {
    print('---${author.token}--');
    if (author.token == userProfile?.token) {
      toastInfo(msg: "You cannot chat to yourself");
    }
    //You sending to someone special.
    var fromMessages =
    await db
        .collection("message")      //"message" is like a database table in firebase.
        .withConverter(
            //Converts firebase to json and json to an object. Firebase only accepts json data.
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where('from_token', isEqualTo: userProfile?.token)  //The one trying to chat
        .where("to_token", isEqualTo: author.token)  //The one trying to chat too.
        .get();
    //Someone special sent messages to you.
    var toMessages =
    await db
        .collection("message")
        .withConverter(
      //Converts firebase to json and json to an object. Firebase only accepts json data.
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore())
        .where('to_token', isEqualTo: userProfile?.token)  //Sending to you
        .where("from_token", isEqualTo: author.token)  //From the certain chatter.
        .get();
    //Check to see if we had a chat before
    if(fromMessages.docs.isEmpty && toMessages.docs.isEmpty){
      //We never had a chat. Firebase found no records of messages in their stored files.
      var msgData = Msg(
        from_token: userProfile?.token,
        to_token: author.token,
        from_name: userProfile?.name,
        to_name: author.name,
        from_avatar: userProfile?.avatar,
        to_avatar: author.avatar,
        from_online: userProfile?.online,
        to_online: author.online,
        last_msg: "",
        last_time: Timestamp.now(),
        msg_num: 0
      );
      var docId = await db.collection("message").withConverter(     //"message is like a table" that creates a row and returns the document ID.
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) =>msg.toFirestore(),
      ).add(msgData);

      //First time here, then navigate to chat page.
      Navigator.of(context).pushNamed(AppRoutes.CHAT,
          arguments: {
            "doc_id":docId.id,     //first is the index, so you have to include this as the index as firebase assumes that you
            "to_token":author.token??"",
            "to_name":author.name??"",
            "to_avatar":author.avatar??"",
            "to_online":author.online.toString()
          }
      );


    }else{
      if(fromMessages.docs.isNotEmpty){     //Here is if you just want to check the navigation page and maybe not chat at all. Above is for the intentions for a new user to chat. Just in case.
        Navigator.of(context).pushNamed(AppRoutes.CHAT,
          arguments: {
            "doc_id":fromMessages.docs.first.id,     //first is the index, so you have to include this as the index as firebase assumes that you
            "to_token":author.token??"",
            "to_name":author.name??"",
            "to_avatar":author.avatar??"",
            "to_online":author.online.toString()
          }
        );
      }

      if(toMessages.docs.isNotEmpty){     //Here is if you just want to check the navigation page and maybe not chat at all. Above is for the intentions for a new user to chat. Just in case.
        Navigator.of(context).pushNamed(AppRoutes.CHAT,
            arguments: {
              "doc_id":toMessages.docs.first.id,     //first is the index, so you have to include this as the index as firebase assumes that you
              "to_token":author.token??"",
              "to_name":author.name??"",
              "to_avatar":author.avatar??"",
              "to_online":author.online.toString()
            }

        );
      }

    }

  }

  Future<void> asyncLoadAuthorData(String token) async {
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity();
    authorRequestEntity.token = token;
    var result = await CourseAPI.courseAuthor(authorRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<ContributorCubits>().triggerContributor(result.data!);
        var res =
            jsonEncode(context.read<ContributorCubits>().state.authorItem);
        print("My author is ${res}");
      }
    }
  }

  Future<void> asyncLoadAuthorCourseData(String token) async {
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity();
    authorRequestEntity.token = token;
    var result = await CourseAPI.courseListAuthor(authorRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<ContributorCubits>().triggerCourseItemChange(result.data!);
      }
    }
  }
}
