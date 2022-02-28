import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:animal_sound/ApiConnection/LocalApiServices.dart';
import 'package:animal_sound/Controllers/AudioControllers.dart';
import 'package:animal_sound/Views/farmview1.dart';
import 'package:animal_sound/Views/forestview1.dart';
import 'package:animal_sound/Views/forestview2.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/FancyFab.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

AudioPlayer backgroungplayer = AudioPlayer();
AudioCache btnclicksound = AudioCache(prefix: 'audio/',fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));

void btnclicksPLY() async{
  ByteData bytes = await rootBundle.load('assets/btn-click.mp3'); //load sound from assets
  Uint8List soundbytes =
  bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  await btnclicksound.playBytes(soundbytes);}
class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with WidgetsBindingObserver {
  Forest1ApiController forest1apiController = Get.put(Forest1ApiController());
  final InAppReview inAppReview = InAppReview.instance;

  List<String> imgDash = [
    "assets/forest.png",
    "assets/farm.png",
    "assets/cat2.png",
    //Image.network("https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",width: 200.w,height: 200.h)
  ];
  bool plyingvalue = true;
  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      backgroungplayer.stop();
    } else if (state == AppLifecycleState.resumed) {
      backgroungplayer.resume();
    } else {
      print(state.toString());
    }
  }
  
  void btnclicksPLY() async{
    ByteData bytes = await rootBundle.load('assets/btn-click.mp3'); //load sound from assets
    Uint8List soundbytes =
    bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
     await btnclicksound.playBytes(soundbytes);}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  inAppReview.openStoreListing(appStoreId: 'com.facebook.katana', microsoftStoreId: 'com.facebook.katana',);
    WidgetsBinding.instance?.addObserver(this);
    setaudioPlayer('assets/preview.mp3');
    OrientationScr.getLandScapMode();
    backgroungplayer.onPlayerStateChanged.listen((event) {
      print("event");
      print(event.name);
    });
  }

  void setaudioPlayer(String audioData) async {
    ByteData bytes = await rootBundle.load(audioData); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await backgroungplayer.playBytes(soundbytes);
    if (result == 1) {
      // success
      backgroungplayer.setReleaseMode(ReleaseMode.LOOP);
    }
  }

  bool checkPlayingstate() {
    switch (backgroungplayer.state) {
      case PlayerState.PLAYING:
        return true;
      case PlayerState.STOPPED:
        return false;
      case PlayerState.PAUSED:
        return false;
      default:
        return true;
    }
  }

  @override
  void dispose() {
    backgroungplayer.stop();
    // TODO: implement dispose
    super.dispose();
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
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg-1.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
            top: 10.h,
            left: 10.w,
            child: SpeedDial(
              foregroundColor: Colors.white,
              activeBackgroundColor: Colors.teal,
              activeForegroundColor: Colors.black,
              backgroundColor: Colors.teal,
              curve: Curves.fastLinearToSlowEaseIn,
              child: Icon(
                Icons.menu_sharp,
                color: Colors.white,
              ),
              direction: SpeedDialDirection.right,
              renderOverlay: false,
              icon: Icons.clear,
              children: [
                SpeedDialChild(
                    onTap: () async {
                      final bytes = await rootBundle.load('assets/logo.jpeg');
                      final list = bytes.buffer.asUint8List();

                      final tempDir = await getTemporaryDirectory();
                      final file =
                          await File('${tempDir.path}/image.jpg').create();
                      file.writeAsBytesSync(list);
                      await Share.shareFiles([file.path],
                          text:
                              "Animal Sound is just a strinking kinds gamming app having diffrent sounds of animals & iot's of learning for kids. Download it now:Androiod:https://play.google.com/store/apps/details?id=com.google.android.youtube and Ios:https://play.google.com/store/apps/details?id=com.google.android.youtube");
                    },
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.yellow),
                SpeedDialChild(onTap: () async{
                  if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                  }
                },
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.yellow),
                plyingvalue == true
                    ? SpeedDialChild(
                        onTap: () {
                          setState(() {
                            if (plyingvalue == true) {
                              plyingvalue = false;
                              backgroungplayer.setVolume(0.0);
                            } else {
                              plyingvalue = true;
                              backgroungplayer.setVolume(1);
                            }
                          });
                        },
                        child: Icon(
                          Icons.volume_up_sharp,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.yellow)
                    : SpeedDialChild(
                        onTap: () {
                          setState(() {
                            if (plyingvalue == true) {
                              plyingvalue = false;
                              backgroungplayer.setVolume(0.0);
                            } else {
                              plyingvalue = true;
                              backgroungplayer.setVolume(1);
                            }
                          });
                        },
                        child: Icon(
                          Icons.volume_mute_sharp,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.yellow),
              ],
            )),
        /* Positioned(
            top: 22.h,
            child: Container(
              width: 100.w,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.h),
                    height: 60.h,
                    width: 23.w,
                    child: Image.asset(
                      'assets/sharing.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.h),
                    height: 60.h,
                    width: 23.w,
                    child: Image.asset(
                      'assets/favorite.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (plyingvalue == true) {
                          plyingvalue = false;
                          backgroungplayer.setVolume(0.0);
                        } else {
                          plyingvalue = true;
                          backgroungplayer.setVolume(1);
                        }
                      });
                    },
                    child: plyingvalue
                        ? Container(
                            padding: EdgeInsets.all(5.h),
                            height: 60.h,
                            width: 23.w,
                            child: Image.asset(
                              'assets/volume-up.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(5.h),
                            height: 60.h,
                            width: 23.w,
                            child: Image.asset(
                              'assets/no-sound.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                  ),
                ],
              ),
            )),*/

        Center(
          child: Container(
            height: ScreenUtil().screenHeight / 2,
            width: ScreenUtil().screenWidth,
            child: ListView.builder(
              itemCount: imgDash.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 50.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                      )
                    ],
                  ),
                  height: 250.h,
                  padding: EdgeInsets.only(
                      bottom: 40.h, right: 20.w, left: 20.w, top: 20.h),
                  child: Bounce(
                    duration: Duration(milliseconds: 700),
                    onPressed: () async {
                      backgroungplayer.pause();
                      switch (index) {
                        case 0:
                           btnclicksPLY();
                          Get.to(() => ForestView1(),
                              transition: Transition.circularReveal,
                              duration: Duration(milliseconds: 400));
                          break;
                        case 1:
                          btnclicksPLY();
                          Get.to(() => FarmView1(),
                              transition: Transition.circularReveal,
                              duration: Duration(milliseconds: 400));
                          break;
                        case 2:
                          btnclicksPLY();
                          Get.to(() => ForestView2(),
                              transition: Transition.circularReveal,
                              duration: Duration(milliseconds: 400));
                          break;
                        default:
                          btnclicksPLY();
                          Get.to(() => ForestView1(),
                              transition: Transition.circularReveal,
                              duration: Duration(milliseconds: 400));
                          break;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Image.asset(
                        imgDash[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(20),
            ),
          ),
        )
      ],
    )));
  }
}
