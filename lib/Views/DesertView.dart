
import 'dart:typed_data';

import 'package:animal_sound/Controllers/FifthCategory.dart';
import 'package:animal_sound/Controllers/NetworkManager.dart';
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

class DesertView extends StatefulWidget {
  const DesertView({Key? key}) : super(key: key);

  @override
  _DesertViewState createState() => _DesertViewState();
}

class _DesertViewState extends State<DesertView> {
  AudioPlayer audioPlayer = AudioPlayer();
FifthCategoryController fifthCategoryController=Get.find();
  @override
  void initState() {
    super.initState();
   fifthCategoryController.getDesertDataApi();
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
          if (fifthCategoryController.isLoading.isTrue) {
            return Stack(
              children: [
                Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Opacity(opacity: 0.3,child: Image.asset('assets/desertart.jpeg')),
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
                          "assets/desertart.jpeg",
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

                      ///cat
                      Positioned(
                          bottom: 100.h,
                          left: 0.w,
                          child: Splash(
                            onTap: () {
                              print("cat");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.cat!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.cat!.image
                                    .toString(),
                                height:120.h,
                                width: 60.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///Camel
                      Positioned(
                          top: 200.h,
                          right: 10.w,
                          child: Splash(
                            onTap: () {
                              print("camel");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.camel!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.camel!.image
                                    .toString(),
                                height: 150.h,
                                width: 70.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///rat
                      Positioned(
                          bottom: 130.h,
                          left: 70.w,
                          child: Splash(
                            onTap: () {
                              print("rat");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.rat!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.rat!.image!
                                    .toString(),
                                height: 70.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///snake1
                      Positioned(
                          bottom: 80.h,
                          right: 125.w,
                          child: Splash(
                            onTap: () {
                              print("snake2");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.snake1!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.snake1!.image
                                    .toString(),
                                height: 150.h,
                                width: 50.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///snake2
                      Positioned(
                          top: 250.h,
                          left: 120.w,
                          child: Splash(
                            onTap: () {
                              print("snake2");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.snake2!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.snake2!.image
                                    .toString(),
                                height: 120.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///tarantulas
                      Positioned(
                          top: 280.h,
                          left: 10.w,
                          child: Splash(
                            onTap: () {
                              print("tarantulas");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.tarantulas!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                  fifthCategoryController
                                      .getDesertData.value!.tarantulas!.image!
                                    .toString(),
                                height: 120.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///thornydevil
                      Positioned(
                          top: 210.h,
                          right: 113.w,
                          child: Splash(
                            onTap: () {
                              print("thornydevil");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.thornydevil!.audioL!)
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.thornydevil!.image
                                    .toString(),
                                height: 120.h,
                                width: 60.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///vulture
                      Positioned(
                          top: 28.h,
                          right: 200.w,
                          child: Splash(
                            onTap: () {
                              print("vulture");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.vulture!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.vulture!.image!,
                                height: 150.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),

                      ///yddax
                      Positioned(
                          bottom:  17.h,
                          right: 15.w,
                          child: Splash(
                            onTap: () {
                              print("yddax");
                              checkPlayingstate()
                                  ? setaudioPlayer(fifthCategoryController
                                  .getDesertData.value!.yddax!.audioL!
                              )
                                  : print("Something went wrong!");
                              setState(() {});
                            },
                            child: Container(
                              child: Image.network(
                                fifthCategoryController
                                    .getDesertData.value!.yddax!.image
                                    .toString(),
                                height: 190.h,
                                width: 100.w,
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
