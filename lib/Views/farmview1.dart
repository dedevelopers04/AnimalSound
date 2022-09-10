import 'dart:typed_data';
import 'package:animal_sound/Controllers/NetworkManager.dart';
import 'package:animal_sound/Controllers/SecondCategory.dart';
import 'package:animal_sound/Model/AudioModelAsset.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Views/HomePageView.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/ConvertUrlToByes.dart';
import 'package:animal_sound/Widget/NoConnectionWidget.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
import 'package:animal_sound/Widget/ScreenUtils.dart';
import 'package:animal_sound/Widget/SplashhTap.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FarmView1 extends StatefulWidget {
  const FarmView1({Key? key}) : super(key: key);

  @override
  _FarmView1State createState() => _FarmView1State();
}

class _FarmView1State extends State<FarmView1> {
  AudioPlayer audioPlayer = AudioPlayer();
  SecondCategoryController secondCategoryController =Get.find();
  @override
  void initState() {

    super.initState();
    //backgroungplayer.setVolume(0.07);
    OrientationScr.getLandScapMode();
    secondCategoryController.getfarmDataApi();
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
  } */ void setaudioPlayer2(Uint8List audioData) async {
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

          if (secondCategoryController.isLoading.isTrue) {
            return Stack(
              children: [
                Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Opacity(opacity: 0.3,child: Image.asset('assets/farm.png')),
                ),
                Center(
                  child:  CircularProgressIndicator()
                ),
              ],
            );
          }
          Future.delayed(Duration(seconds: 2));
          return WillPopScope(onWillPop: willpopScop,
            child: Scaffold(
              body: Splash(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: ScreenUtil().screenHeight,
                      width: ScreenUtil().screenWidth,
                      child: Image.asset(
                        "assets/farm.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        bottom: 23.h,
                        left: -25.w,
                        child: Bounce(duration: Duration(milliseconds: 500),
                            onPressed: () async {
                              btnclicksPLY();
                              Get.off(()=>HomePageView());
                            },
                            child: Container(
                                height: 100.h,
                                width: 100.w,
                                child: Image.asset('assets/homebutton.png')))),
                    ///bull
                    Positioned(
                        top: 150.h,
                        left: 30.w,
                        child: Splash(
                          onTap: () {
                            print("bull");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.bull.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.bull.image.toString(),
                              height: 120.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///Cat
                    Positioned(
                        top: 180.h,
                        right: 40.w,
                        child: Splash(
                          onTap: () {
                            print("cat");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.cat.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.cat.image.toString(),
                              height: 70.h,
                              width: 20.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///chicken
                    Positioned(
                        bottom: 160.h,
                        left: 30.w,
                        child: Splash(
                          onTap: () {
                            print("chicken");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.chicken.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.chicken.image.toString(),
                              height: 150.h,
                              width: 60.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///cow
                    Positioned(
                        top: 300.h,
                        right: 25.w,
                        child: Splash(
                          onTap: () {
                            print("cow");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.cow.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.cow.image.toString(),
                              height: 120.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///dog
                    Positioned(
                        top: 330.h,
                        left: 130.w,
                        child: Splash(
                          onTap: () {
                            print("dog");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.dog.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.dog.image.toString(),
                              height: 80.h,
                              width: 30.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///donkey
                    Positioned(
                        bottom: 0.h,
                        right: 0.w,
                        child: Splash(
                          onTap: () {
                            print("donkey");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.donkey.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.donkey.image.toString(),
                              height: 250.h,
                              width: 100.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///goat
                    Positioned(
                        top: 210.h,
                        left: 150.w,
                        child: Splash(
                          onTap: () {
                            print("goat");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.goat.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.goat.image.toString(),
                              height: 100.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///hourse
                    Positioned(
                        top: 300.h,
                        right: 140.w,
                        child: Splash(
                          onTap: () {
                            print("hourse");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.hourse.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.hourse.image,
                              height: 150.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///lamb
                    Positioned(
                        bottom: 20.h,
                        left: 100.w,
                        child: Splash(
                          onTap: () {
                            print("lamb");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.lamb.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.lamb.image,
                              height: 160.h,
                              width: 50.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///parrot
                    Positioned(
                        top: 20.h,
                        right: 140.w,
                        child: Splash(
                          onTap: () {
                            print("parrot");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.parrots.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.parrots.image,
                              height: 100.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///pigeous
                    Positioned(
                        top: 50.h,
                        left: 80.w,
                        child: Splash(
                          onTap: () {
                            print("pigeous");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.pigeons.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.pigeons.image,
                              height: 70.h,
                              width: 30.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///ping
                    Positioned(
                        top: 330.h,
                        right: 80.w,
                        child: Splash(
                          onTap: () {
                            print("ping");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.pig.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.pig.image,
                              height: 100.h,
                              width: 30.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///raven
                    Positioned(
                        top: 80.h,
                        right: 75.w,
                        child: Splash(
                          onTap: () {
                            print("raven");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.raven.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.raven.image,
                              height: 90.h,
                              width: 25.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///rooster
                    Positioned(
                        top: 210.h,
                        left: 85.w,
                        child: Splash(
                          onTap: () {
                            print("rooster");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.rooster.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.rooster.image,
                              height: 100.h,
                              width: 25.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),

                    ///turkey
                    Positioned(
                        bottom: 100.h,
                        right: 135.w,
                        child: Splash(
                          onTap: () {
                            print("turkey");
                            checkPlayingstate()
                                ? setaudioPlayer2(secondCategoryController.getFarmData.value!.turkey.audioL)
                                : print("Something went wrong!");
                            setState(() {});
                          },
                          child: Container(
                            child: Image.network(
                              secondCategoryController.getFarmData.value!.turkey.image,
                              height: 120.h,
                              width: 35.w,
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
