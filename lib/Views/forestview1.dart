import 'dart:typed_data';
import 'package:animal_sound/Controllers/FirstcategoryController.dart';
import 'package:animal_sound/Controllers/NetworkManager.dart';
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

class ForestView1 extends StatefulWidget {
  const ForestView1({Key? key}) : super(key: key);

  @override
  _ForestView1State createState() => _ForestView1State();
}

class _ForestView1State extends State<ForestView1> {
  FirstCategoryController firstCategoryController = Get.find();
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    firstCategoryController.getJungleOneList();
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

  Future<bool> willpopScop ()async{
    Get.off(()=>HomePageView());
    return true;
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
          if (firstCategoryController.isLoading.isTrue) {
            return Stack(
              children: [
                Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Opacity(opacity: 0.3,child: Image.asset('assets/forest.png')),
                ),
                Center(
                  child: CircularProgressIndicator()
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
                          "assets/forest.png",
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

                      ///Elephant
                      Positioned(
                          top: 150.h,
                          left: 0.w,
                          child: Splash(
                            onTap: () {
                              print("elephant");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.elephant.audioL
                                  )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.elephant.image
                                    .toString(),
                                height: 220.h,
                                width: 90.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///Cobra
                      Positioned(
                          top: 350.h,
                          left: 70.w,
                          child: Splash(
                            onTap: () {
                              print("cobra");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.cobra.audioL
                                  )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.cobra.image
                                    .toString(),
                                height: 140.h,
                                width: 30.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///rebit
                      Positioned(
                          bottom: 30.h,
                          left: 135.w,
                          child: Splash(
                            onTap: () {
                              print("rabit");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.rebit.audioL)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.rebit.image
                                    .toString(),
                                height: 150.h,
                                width: 30.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///bison
                      Positioned(
                          top: 250.h,
                          right: 25.w,
                          child: Splash(
                            onTap: () {
                              print("bison.png");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.bison.audioL)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.bison.image
                                    .toString(),
                                height: 150.h,
                                width: 50.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///elk
                      Positioned(
                          top: 250.h,
                          right: 80.w,
                          child: Splash(
                            onTap: () {
                              print("elk");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.elk.audioL)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController.getJungleOneData.value!.elk.image
                                    .toString(),
                                height: 150.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///coyotes
                      Positioned(
                          top: 280.h,
                          left: 130.w,
                          child: Splash(
                            onTap: () {
                              print("coyotes");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.coyotes.audioL
                                  )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.coyotes.image
                                    .toString(),
                                height: 150.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///aligator
                      Positioned(
                          bottom: 10.h,
                          right: 13.w,
                          child: Splash(
                            onTap: () {
                              print("aligator");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.alligator.audioL)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.alligator.image
                                    .toString(),
                                height: 180.h,
                                width: 100.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///frog
                      Positioned(
                          bottom: 58.h,
                          right: 130.w,
                          child: Splash(
                            onTap: () {
                              print("frog");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.frog.audioL
                                  )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController.getJungleOneData.value!.frog.image
                                    .toString(),
                                height: 150.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///geier
                      Positioned(
                          top: 157.h,
                          right: 135.w,
                          child: Splash(
                            onTap: () {
                              print("geierSound");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.geier.audioL
                                  )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.geier.image
                                    .toString(),
                                height: 100.h,
                                width: 25.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///monkey
                      Positioned(
                          top: 3.h,
                          right: 3.w,
                          child: Splash(
                            onTap: () {
                              print("monkey");
                              checkPlayingstate()
                                  ? setaudioPlayer(firstCategoryController
                                  .getJungleOneData.value!.monkey.audioL
                                  )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                firstCategoryController
                                    .getJungleOneData.value!.monkey.image
                                    .toString(),
                                height: 180.h,
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