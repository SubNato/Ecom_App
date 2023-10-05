//This class is to unify the BlocProvider and routes and pages/screenNames. It is a good practice to do.

import 'package:flutter/cupertino.dart';


class AppRoutes{
  List<PageEntity> routes=[

  ];
}
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
