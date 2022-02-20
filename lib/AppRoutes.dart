
import 'package:get/get.dart';

import 'Views/HomePageView.dart';

class AppRoutes{
  AppRoutes._();
  static final routes=[
    GetPage(name: "/HomePage", page: ()=>HomePageView())
  ];
}