
import 'dart:typed_data';

import 'package:animal_sound/Controllers/NetworkManager.dart';
import 'package:animal_sound/Controllers/SixCategory.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/NoConnectionWidget.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
import 'package:animal_sound/Widget/ScreenUtils.dart';
import 'package:animal_sound/Widget/SplashhTap.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'HomePageView.dart';

class SnowView extends StatefulWidget {
  const SnowView({Key? key}) : super(key: key);

  @override
  _SnowViewState createState() => _SnowViewState();
}

class _SnowViewState extends State<SnowView> {
  SixCategoryController sixCategoryController = Get.find();
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    sixCategoryController.getSnowDataApi();
    //  backgroungplayer.setVolume(0.07);
    OrientationScr.getLandScapMode();
    // TODO: implement initState
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
  Future<bool> willpopScop ()async{
    Get.off(()=>HomePageView());
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.stop();
    // backgroungplayer.setVolume(1);
    backgroungplayer.resume();
    super.dispose();
  }

  /*void setaudioPlayer(String audioData) async {
    ByteData bytes = await rootBundle.load(audioData); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    if (result == 1) {
      // success
    }
  }*/
  void setaudioPlayer(Uint8List audioData) async {
    Uint8List soundbytes = audioData.buffer.asUint8List(audioData.offsetInBytes, audioData.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    if (result == 1) {
      // success
    }
  }

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
          if (sixCategoryController.isLoading.isTrue) {
            return Stack(
              children: [
                Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Opacity(opacity: 0.3,child: Image.asset('assets/Snow.jpeg')),
                ),
                Center(
                  child:  CircularProgressIndicator()
                ),
              ],
            );
          }
          return WillPopScope(onWillPop: willpopScop,
            child: Scaffold(
                body: Splash(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        height: ScreenUtil().screenHeight,
                        //  height: size.height.h,
                        width: ScreenUtil().screenWidth,
                        child: Image.asset(
                          "assets/Snow.jpeg",
                          // firstCategoryController.getJungleOneData.value.data.where((element) => false),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                          bottom: 23.h,
                          left: -25.w,
                          child: Bounce(
                              duration: Duration(milliseconds: 500),
                              onPressed: () async {
                                btnclicksPLY();
                                Get.off(()=>HomePageView());
                              },
                              child: Container(
                                  height: 100.h,
                                  width: 100.w,
                                  child: Image.asset('assets/homebutton.png')))),

                      ///owl
                      Positioned(
                          top: 280.h,
                          left: 120.w,
                          child: Splash(
                            onTap: () {
                              print("owl");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.owl!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.owl!.image!.toString(),
                                height: 80.h,
                                width: 25.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///bear
                      Positioned(
                          bottom: 130.h,
                          right: 10.w,
                          child: Splash(
                            onTap: () {
                              print("bear");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.bear!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.bear!.image!,
                                height: 140.h,
                                width: 50.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///leopard
                      Positioned(
                          bottom: 210.h,
                          right: 50.w,
                          child: Splash(
                            onTap: () {
                              print("leopard");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.leopard!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.leopard!.image
                                    .toString(),
                                height: 160.h,
                                width: 70.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///bluejay
                      Positioned(
                          top: 55.h,
                          right: 140.w,
                          child: Splash(
                            onTap: () {
                              print("bluejay");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.bluejay!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.bluejay!.image
                                    .toString(),
                                height: 60.h,
                                width: 30.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///fox
                      Positioned(
                          bottom: 200.h,
                          right: 150.w,
                          child: Splash(
                            onTap: () {
                              print("fox");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.fox!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.fox!.image!,
                                height: 120.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///rabbit
                      Positioned(
                          bottom: 20.h,
                          left: 100.w,
                          child: Splash(
                            onTap: () {
                              print("rabbit");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.rabbit!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.rabbit!.image
                                    .toString(),
                                height: 120.h,
                                width: 35.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///penguin
                      Positioned(
                          bottom:210.h,
                          left: 40.w,
                          child: Splash(
                            onTap: () {
                              print("penguin");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.penguin!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.penguin!.image
                                    .toString(),
                                height: 130.h,
                                width: 30.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///squirrel
                      Positioned(
                          bottom: 130.h,
                          left: 45.w,
                          child: Splash(
                            onTap: () {
                              print("squirrel");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.squirrel!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.squirrel!.image
                                    .toString(),
                                height: 50.h,
                                width: 20.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///seal
                      Positioned(
                          bottom: 30.h,
                          right: 90.w,
                          child: Splash(
                            onTap: () {
                              print("seal");
                              checkPlayingstate()
                                  ? setaudioPlayer(sixCategoryController.getSnowData.value!.seal!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                sixCategoryController.getSnowData.value!.seal!.image
                                    .toString(),
                                height: 110.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                    ],
                  ),
                )),
          );
        });
      }
    },);
  }
}
