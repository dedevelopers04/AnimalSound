import 'dart:typed_data';

import 'package:animal_sound/ApiConnection/LocalApiServices.dart';
import 'package:animal_sound/Controllers/AudioControllers.dart';
import 'package:animal_sound/Model/AudioModelAsset.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
import 'package:animal_sound/Widget/SplashhTap.dart';
import 'package:animal_sound/Widget/TouchRippleIffect.dart';
import 'package:animal_sound/app_uiManager.dart';
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
  // Forest1ApiController forest1apiController=Get.find();
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  //  backgroungplayer.setVolume(0.07);
    OrientationScr.getLandScapMode();
    // TODO: implement initState
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.stop();
   // backgroungplayer.setVolume(1);
    backgroungplayer.resume();
    super.dispose();
  }

  void setaudioPlayer(String audioData) async {
    ByteData bytes = await rootBundle.load(audioData); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
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
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.landscape);
    // AppUIManager uiManager = AppUIManager.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              bottom: 23.h,
              left: -25.w,
              child: Bounce(duration: Duration(milliseconds: 500),
                  onPressed: () async {
                    btnclicksPLY();
                    Get.back();
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
                      ? setaudioPlayer(Sounds.elephantSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.elephantImage,
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
                      ? setaudioPlayer(Sounds.cobraSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.cobraImage,
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
                      ? setaudioPlayer(Sounds.rebitSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.rebitImage,
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
                      ? setaudioPlayer(Sounds.bisonSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.bisonImage,
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
                      ? setaudioPlayer(Sounds.elkSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.elkImage,
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
                      ? setaudioPlayer(Sounds.coyotesSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.coyotesImage,
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
                      ? setaudioPlayer(Sounds.alligatorSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.alligatorImage,
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
                      ? setaudioPlayer(Sounds.frogsSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.frogsImage,
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
                      ? setaudioPlayer(Sounds.geierSound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.geierImage,
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
                      ? setaudioPlayer(Sounds.monkeySound)
                      : print("Something went wrong!");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    ImagesCat.monkeyImage,
                    height: 180.h,
                    width: 40.w,
                    fit: BoxFit.fill,
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
