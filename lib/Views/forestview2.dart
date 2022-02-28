import 'dart:typed_data';
import 'dart:math' as math;
import 'package:animal_sound/Model/AudioModelAsset.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
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
    audioPlayer.stop();
  //  backgroungplayer.setVolume(1);
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                      Get.back();
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
                        ? setaudioPlayer(Sounds.leopardSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.leopardImage,
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
                        ? setaudioPlayer(Sounds.tigerSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.lionImage,
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
                        ? setaudioPlayer(Sounds.tigerSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.crowImage,
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
                        ? setaudioPlayer(Sounds.loweSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.owlImage,
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
                        ? setaudioPlayer(Sounds.grasshopperSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      child: Image.asset(
                        ImagesCat.grasshopperImage,
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
                        ? setaudioPlayer(Sounds.schimpanseSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Transform.rotate(
                    angle: -math.pi / 6.0,
                    child: Container(
                      child: Image.asset(
                        ImagesCat.schimpanseImage,
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
                        ? setaudioPlayer(Sounds.rhinozerusSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.rhinozerusImage,
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
                        ? setaudioPlayer(Sounds.tigerSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.tigerImage,
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
                        ? setaudioPlayer(Sounds.gorillaSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.gorillaImage,
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
                        ? setaudioPlayer(Sounds.wolfSound)
                        : print("Something went wrong!");
                    setState(() {});
                  },
                  child: Container(
                    child: Image.asset(
                      ImagesCat.wolfImage,
                      height: 210.h,
                      width: 55.w,
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
