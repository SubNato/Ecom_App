import 'package:ecom_app/widgets/base_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Chat"),
      body: Center(child: Text("Chat"),),
    );
  }
}
