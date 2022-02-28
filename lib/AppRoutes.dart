
import 'package:animal_sound/Views/farmview1.dart';
import 'package:animal_sound/Views/forestview1.dart';
import 'package:animal_sound/Views/forestview2.dart';
import 'package:get/get.dart';

import 'Views/HomePageView.dart';

class AppRoutes{
  AppRoutes._();
  static final routes=[
    GetPage(name: "/HomePage", page: ()=>HomePageView()),
    GetPage(name: "/forestView", page: ()=>ForestView1()),
    GetPage(name: "/ForestView2", page: ()=>ForestView2()),
    GetPage(name: "/FarmView1", page: ()=>FarmView1())
  ];
}