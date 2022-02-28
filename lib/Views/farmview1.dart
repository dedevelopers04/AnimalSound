import 'dart:typed_data';
import 'package:animal_sound/Model/AudioModelAsset.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Views/HomePageView.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
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

  @override
  void initState() {

    super.initState();
    //backgroungplayer.setVolume(0.07);
    OrientationScr.getLandScapMode();
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

  void setaudioPlayer(String audioData) async {
    ByteData bytes = await rootBundle.load(audioData); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    if (result == 1) {
      // success
      audioPlayer.setVolume(1);
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                      Get.back();
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
                        ? setaudioPlayer(Sounds.bullSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.bullImage,
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
                        ? setaudioPlayer(Sounds.catSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.catImage,
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
                        ? setaudioPlayer(Sounds.chickenSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.chickenImage,
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
                        ? setaudioPlayer(Sounds.cowSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.cowImage,
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
                        ? setaudioPlayer(Sounds.dogSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.dogImage,
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
                        ? setaudioPlayer(Sounds.donkeySound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.donkeyImage,
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
                        ? setaudioPlayer(Sounds.goatSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.goatImage,
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
                        ? setaudioPlayer(Sounds.horseSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.horseImage,
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
                        ? setaudioPlayer(Sounds.lambSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.lambImage,
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
                        ? setaudioPlayer(Sounds.parrotSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.parrotImage,
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
                        ? setaudioPlayer(Sounds.pigeonsSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.pigeonsImage,
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
                        ? setaudioPlayer(Sounds.pigSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.pigImage,
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
                        ? setaudioPlayer(Sounds.ravenSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.ravenImage,
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
                        ? setaudioPlayer(Sounds.roosterSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.roosterImage,
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
                        ? setaudioPlayer(Sounds.turkeySound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.turkeyImage,
                      height: 120.h,
                      width: 35.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
