import 'dart:async';

import 'package:animal_sound/Views/HomePageView.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.landscape);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: Image.asset('assets/splash.jpeg', fit: BoxFit.fill),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                height: 120.h,
                width: 160.w,

                child: Image.asset("assets/apptext.png",fit: BoxFit.fill,),
              )),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: ScreenUtil().screenWidth / 1.8,
                  height: 30.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: controller.value,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                      backgroundColor: Color(0xffD6D6D6),
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
  @override
  void initState() {
    OrientationScr.getLandScapMode();
    _initGoogleMobileAds();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        setState(() {});

      });
    controller.forward();
    _animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  Timer(Duration(milliseconds: 4400),()=>Get.off(()=>HomePageView()));
    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
