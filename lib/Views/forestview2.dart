import 'dart:typed_data';
import 'dart:math' as math;
import 'package:animal_sound/Controllers/NetworkManager.dart';
import 'package:animal_sound/Controllers/SecondCategory.dart';
import 'package:animal_sound/Controllers/ThirdCategory.dart';
import 'package:animal_sound/Model/AudioModelAsset.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/NoConnectionWidget.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
import 'package:animal_sound/Widget/ScreenUtils.dart';
import 'package:animal_sound/Widget/SplashhTap.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'HomePageView.dart';

class ForestView2 extends StatefulWidget {
  const ForestView2({Key? key}) : super(key: key);

  @override
  _ForestView2State createState() => _ForestView2State();
}

class _ForestView2State extends State<ForestView2> {
  ThirdCategoryControllers thirdCategoryControllers=Get.find();
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {

    super.initState();
    //backgroungplayer.setVolume(0.07);
    OrientationScr.getLandScapMode();
    thirdCategoryControllers.getforest2dataApi();
    // TODO: implement initState
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // backgroungplayer.setVolume(1);
    backgroungplayer.resume();
    audioPlayer.stop();
    super.dispose();
  }

/*  void setaudioPlayer1(String audioData) async {
  Uint8List data =  await ConvertBytes.instance.downloadFile(audioData);
    Uint8List soundbytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    if (result == 1) {
      audioPlayer.setVolume(1);
    }
  } */ void setaudioPlayer(Uint8List audioData) async {
    //Uint8List data =  await ConvertBytes.instance.downloadFile(audioData);
    Uint8List soundbytes =
    audioData.buffer.asUint8List(audioData.offsetInBytes, audioData.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    if (result == 1) {
      audioPlayer.setVolume(1);
    }
  }
  /*void setaudioPlayer(String audioData) async {

    int result = await audioPlayer.play(audioData);
    if (result == 1) {
      // success
      audioPlayer.setVolume(1);
    }
  }*/

  bool checkPlayingstate() {
    switch (audioPlayer.state) {
      case PlayerState.PLAYING:
        audioPlayer.stop();
        return true;
      case PlayerState.STOPPED:
        return true;
      case PlayerState.PAUSED:
        audioPlayer.stop();
        return true;
      case PlayerState.COMPLETED:
        return true;
      default:
        return false;
    }
  }
  Future<bool> willpopScop ()async{
    Get.off(()=>HomePageView());
    return true;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      print("pause");
      backgroungplayer.pause();
      audioPlayer.pause();
    } else if (state == AppLifecycleState.resumed) {
      //  print("resume");
      // backgroungplayer.resume();
    } else {
      print(state.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtilsModel().setCurrentUtils(context);
    return GetBuilder<GetXNetworkManager>(builder: (controller) {
      if(controller.connectionType.value==0){
        ScreenUtilsModel().setCurrentUtils(context);
        return Builder(builder: (context) {
          return AdvanceCustomAlert();
        },);
      }else{
        ScreenUtilsModel().setCurrentUtils(context);
        return Obx(() {

          if (thirdCategoryControllers.isLoading.isTrue) {
            return Stack(
              children: [
                Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Opacity(opacity: 0.3,child: Image.asset('assets/cat2.png')),
                ),
                Center(
                  child:  CircularProgressIndicator()
                ),
              ],
            );
          }
          ///forestview2
          Future.delayed(Duration(seconds: 2));
          return WillPopScope(onWillPop: willpopScop,
            child: Scaffold(
              body: Splash(onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: ScreenUtil().screenHeight,
                      width: ScreenUtil().screenWidth,
                      child: Image.asset(
                        "assets/cat2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        bottom: 23.h,
                        left: -25.w,
                        child: Bounce(
                            onPressed: () async {
                              btnclicksPLY();
                              Get.off(()=>HomePageView());
                            },
                            duration: Duration(milliseconds: 500),
                            child: Container(
                                height: 100.h,
                                width: 100.w,
                                child: Image.asset('assets/homebutton.png')))),
                    ///leopard
                    Positioned(
                        top:100.h,
                        left: -20.w,
                        child: Splash(
                          onTap: () {
                            print("leopard");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.leopard.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.leopard.image,
                              height: 300.h,
                              width: 120.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///lion
                    Positioned(
                        top: 350.h,
                        left: 20.w,
                        child: Splash(
                          onTap: () {
                            print("lion");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.lion.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.lion.image,
                              height: 180.h,
                              width: 70.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///crow
                    Positioned(
                        top: 100.h,
                        left: 150.w,
                        child: Splash(
                          onTap: () {
                            print("crow");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.crow.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.crow.image,
                              height: 50.h,
                              width: 25.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///owl
                    Positioned(
                        top: 80.h,
                        right: 90.w,
                        child: Splash(
                          onTap: () {
                            print("owl");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.owl.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.owl.image,
                              height: 90.h,
                              width: 20.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///grasshopper
                    Positioned(
                        bottom: 100.h,
                        right: 45.w,
                        child: Splash(
                          onTap: () {
                            print("grasshopper");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.grasshopper.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Container(
                              child: Image.network(
                                thirdCategoryControllers.getforest2data.value!.grasshopper.image,
                                height: 50.h,
                                width: 45.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )),

                    ///schimpanse
                    Positioned(
                        top: 28.h,
                        right: 30.w,
                        child: Splash(
                          onTap: () {
                            print("schimpanse");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.schimpanse.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Transform.rotate(
                            angle: -math.pi / 6.0,
                            child: Container(
                              child: Image.network(
                                thirdCategoryControllers.getforest2data.value!.schimpanse.image,
                                height: 150.h,
                                width: 50.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )),

                    ///rhinozerus
                    Positioned(
                        bottom: 150.h,
                        left: 120.w,
                        child: Splash(
                          onTap: () {
                            print("rhinozerus");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.rhinozerus.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.rhinozerus.image,
                              height: 160.h,
                              width: 45.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///tiger
                    Positioned(
                        top: 328.h,
                        right: 150.w,
                        child: Splash(
                          onTap: () {
                            print("tiger");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.tiger.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.tiger.image,
                              height: 150.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///gorilla
                    Positioned(
                        bottom: 38.h,
                        right: 90.w,
                        child: Splash(
                          onTap: () {
                            print("gorilla");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.gorilla.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.gorilla.image,
                              height: 210.h,
                              width: 55.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    ///wolf
                    Positioned(
                        bottom: 190.h,
                        right: -20.w,
                        child: Splash(
                          onTap: () {
                            print("wolf");
                            checkPlayingstate()
                                ? setaudioPlayer(thirdCategoryControllers.getforest2data.value!.wolf.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              thirdCategoryControllers.getforest2data.value!.wolf.image,
                              height: 210.h,
                              width: 55.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );

        });
      }
    },);
  }
}