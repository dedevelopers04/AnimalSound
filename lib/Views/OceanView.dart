
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:animal_sound/Controllers/ForthCategoryController.dart';
import 'package:animal_sound/Controllers/NetworkManager.dart';
import 'package:animal_sound/Controllers/ThirdCategory.dart';
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
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'HomePageView.dart';

class OceanView extends StatefulWidget {
  const OceanView({Key? key}) : super(key: key);

  @override
  _OceanViewState createState() => _OceanViewState();
}

class _OceanViewState extends State<OceanView> {

 ForthCategoryController forthCategoryController=Get.find();
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    backgroungplayer.pause();
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
    //  backgroungplayer.setVolume(1);
    backgroungplayer.resume();
    super.dispose();
  }


  void setaudioPlayer(Uint8List audioData) async {
    Uint8List soundbytes =
    audioData.buffer.asUint8List(audioData.offsetInBytes, audioData.lengthInBytes);
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
        return Obx((){
          if (forthCategoryController.isLoading.isTrue) {
            return Stack(
              children: [
                Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Opacity(opacity: 0.3,child: Image.asset('fourthcategory.jpeg')),
                ),
                Center(
                  child: CircularProgressIndicator()
                ),
              ],
            );
          }
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
                        "assets/fourthcategory.jpeg",
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
                    ///Dolphin
                    Positioned(
                        top: 130.h,  right: 110.w,
                        child: Splash(
                          onTap: () {
                            print("Dolphin");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.dolphin!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.dolphin!.image!,
                              height: 80.h,
                              width: 50.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///seaHourse
                    Positioned(
                        top: 130.h,
                        left: 20.w,
                        child: Splash(
                          onTap: () {
                            print("seaHourse");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.seahorse!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.seahorse!.image!,
                              height: 80.h,
                              width: 30.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///seaLion
                    Positioned(
                        bottom: 110.h,
                        left: 0.w,
                        child: Splash(
                          onTap: () {
                            print("seaLion");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.sealion!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.sealion!.image!,
                              height: 180.h,
                              width: 70.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///Shark
                    Positioned(
                        top: 150.h,
                        right: 10.w,
                        child: Splash(
                          onTap: () {
                            print("Shark");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.shark!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.shark!.image!,
                              height: 100.h,
                              width: 90.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///scropions
                    Positioned(
                        bottom: 20.h,
                        right: 60.w,
                        child: Splash(
                          onTap: () {
                            print("scropions");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.scorpions!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.scorpions!.image!,
                              height: 70.h,
                              width: 30.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///snail
                    Positioned(
                        bottom: 128.h,
                        left: 110.w,
                        child: Splash(
                          onTap: () {
                            print("snail");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.snail!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Transform.rotate(
                            angle: -math.pi / 16.0,
                            child: Container(
                              child: Image.network(
                                forthCategoryController.getwaterAnimalData.value!.snail!.image!,
                                height: 50.h,
                                width: 20.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )),

                    ///star2
                    Positioned(
                        bottom: 20.h,
                        left: 160.w,
                        child: Splash(
                          onTap: () {
                            print("star2");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.star2!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.star2!.image!,
                              height: 60.h,
                              width: 30.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///star1
                    Positioned(
                        bottom: 160.h,
                        right: 0.w,
                        child: Splash(
                          onTap: () {
                            print("star1");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.star1!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.star1!.image!,
                              height: 55.h,
                              width: 27.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    ///stone1
                    Positioned(
                        bottom: -15.h,
                        right: 0.w,
                        child: Splash(
                          onTap: () {
                            },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.stone1!.image!,
                              height: 150.h,
                              width: 70.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    ///stone2
                    Positioned(
                        bottom: 128.h,
                        right: 30.w,
                        child: Splash(
                          onTap: () {
                            },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.stone2!.image!,
                              height: 150.h,
                              width: 60.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///turtle
                    Positioned(
                        bottom: 90.h,
                        right: 90.w,
                        child: Splash(
                          onTap: () {
                            print("turtle");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.turtle!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.turtle!.image!,
                              height: 90.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    ///whale
                    Positioned(
                        top: 190.h,
                        left: 80.w,
                        child: Splash(
                          onTap: () {
                            print("whale");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.whale!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.whale!.image!,
                              height: 100.h,
                              width: 80.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    ///octopus
                    Positioned(
                        bottom: 190.h,
                        right: 160.w,
                        child: Splash(
                          onTap: () {
                            print("octopus");
                            checkPlayingstate()
                                ? setaudioPlayer(forthCategoryController.getwaterAnimalData.value!.octopus!.audioL!)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              forthCategoryController.getwaterAnimalData.value!.octopus!.image!,
                              height: 100.h,
                              width: 40.w,
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
