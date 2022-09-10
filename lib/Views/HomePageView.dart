import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:animal_sound/Controllers/FifthCategory.dart';
import 'package:animal_sound/Controllers/FirstcategoryController.dart';
import 'package:animal_sound/Controllers/ForthCategoryController.dart';
import 'package:animal_sound/Controllers/NetworkManager.dart';
import 'package:animal_sound/Controllers/SecondCategory.dart';
import 'package:animal_sound/Controllers/SixCategory.dart';
import 'package:animal_sound/Controllers/ThirdCategory.dart';
import 'package:animal_sound/Model/Jungle1Model.dart';
import 'package:animal_sound/Services/Ad_Helper.dart';
import 'package:animal_sound/Views/DesertView.dart';
import 'package:animal_sound/Views/OceanView.dart';
import 'package:animal_sound/Views/SnowView.dart';
import 'package:animal_sound/Views/farmview1.dart';
import 'package:animal_sound/Views/forestview1.dart';
import 'package:animal_sound/Views/forestview2.dart';
import 'package:animal_sound/Widget/BouncyWidget.dart';
import 'package:animal_sound/Widget/NoConnectionWidget.dart';
import 'package:animal_sound/Widget/Oreantation.dart';
import 'package:animal_sound/Widget/ScreenUtils.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
AudioCache btnclicksound = AudioCache(
    prefix: 'audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));

void btnclicksPLY() async {
  ByteData bytes =
      await rootBundle.load('assets/btn-click.mp3'); //load sound from assets
  Uint8List soundbytes =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  await btnclicksound.playBytes(soundbytes);
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with WidgetsBindingObserver {
  FirstCategoryController firstCategoryController =
      Get.put(FirstCategoryController());
  SecondCategoryController secondCategoryController =
      Get.put(SecondCategoryController());
  ThirdCategoryControllers thirdCategoryControllers =
      Get.put(ThirdCategoryControllers());
  ForthCategoryController forthCategoryController =
      Get.put(ForthCategoryController());
  SixCategoryController sixCategoryController=Get.put(SixCategoryController());
  FifthCategoryController fifthCategoryController=Get.put(FifthCategoryController());
  GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();
  final InAppReview inAppReview = InAppReview.instance;

  List<String> imgDash = [
    "assets/forest.png",
    "assets/farm.png",
    "assets/cat2.png",
    "assets/desertart.jpeg",
    "assets/fourthcategory.jpeg",
    "assets/Snow.jpeg",

  ];
  bool plyingvalue = true;
  late BannerAd _bannerAd;
  late RewardedAd _rewardedAd;
  bool _isBannerAdReady = false;
  bool _isRewardedAdReady = false;
  InterstitialAd? _interstitialAd;

  // TODO: Add _isInterstitialAdReady
  bool _isInterstitialAdReady = false;
  bool _isInterstitialAdReady2 = false;


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      print("pause");
      backgroungplayer.pause();
    } else if (state == AppLifecycleState.resumed) {
    //  print("resume");
     // backgroungplayer.resume();
    } else {
      print(state.toString());
    }
  }
  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          this._rewardedAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                print("GettingreadyFalse");
                _isRewardedAdReady = false;
              });
              _loadRewardedAd();
            },
          );

          setState(() {
            print("Gettingreadytrue");
            _isRewardedAdReady = true;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
          setState(() {
            print("GettingreadyFalse");
            _isRewardedAdReady = false;
          });
        },
      ),
    );
  }

  // TODO: Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
            },
          );

          _isInterstitialAdReady = true;
          _isInterstitialAdReady2 = true;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _isInterstitialAdReady = false;
          _isInterstitialAdReady2 = false;
        },
      ),
    );
  }

  /* void btnclicksPLY() async {
    ByteData bytes =
        await rootBundle.load('assets/btn-click.mp3'); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await btnclicksound.playBytes(soundbytes);
  }
*/
  @override
  void initState() {
    // TODO: implement initState
    print("networkConnection");
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    setaudioPlayer('assets/preview.mp3');
    OrientationScr.getLandScapMode();

    firstCategoryController.getJungleOneList();
    _bannerAdLoad();
    _loadRewardedAd();
    _loadInterstitialAd();

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
    _bannerAd.dispose();
    _rewardedAd.dispose();
    _interstitialAd?.dispose();
    backgroungplayer.stop();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtilsModel().setCurrentUtils(context);
    return GetBuilder<GetXNetworkManager>(
      builder: (controller) {
        if (controller.connectionType.value == 0) {
          ScreenUtilsModel().setCurrentUtils(context);
          return Builder(
            builder: (context) {
              return AdvanceCustomAlert();
            },
          );
        } else {
          ScreenUtilsModel().setCurrentUtils(context);
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
                            final bytes =
                                await rootBundle.load('assets/logo.jpeg');
                            final list = bytes.buffer.asUint8List();
                            final tempDir = await getTemporaryDirectory();
                            final file = await File('${tempDir.path}/image.jpg')
                                .create();
                            file.writeAsBytesSync(list);
                            await Share.shareFiles([file.path],
                                text:
                                    "Animal Sound is just a strinking kinds gamming app having diffrent sounds of animals & iot's of learning for kids. Download it now:Androiod:https://play.google.com/store/apps/details?id=com.whitelight.animalsSound");
                          },
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.yellow),
                      SpeedDialChild(
                          onTap: () async {
                            if (await inAppReview.isAvailable()) {
                              inAppReview.requestReview();
                            }else{
                              final snackbar=SnackBar(content:Text('Something went wrong!'));
                              Scaffold.of(context).showSnackBar(snackbar);
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


              Center(
                child: Container(
                  height: ScreenUtil().screenHeight / 1.5,
                  width: ScreenUtil().screenWidth,
                  child: ListView.builder(
                    itemCount: imgDash.length,shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(30),
                        child: Container(
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
                          child: Bounce(
                            duration: Duration(milliseconds: 700),
                            onPressed: () async {
                              backgroungplayer.pause();
                              switch (index) {
                                case 0:
                                  btnclicksPLY();
                                  Get.off(() => ForestView1(),
                                      transition: Transition.circularReveal,
                                      duration: Duration(milliseconds: 400));
                                  break;
                                case 1:
                                  btnclicksPLY();
                                  Get.off(() => FarmView1(),
                                      transition: Transition.circularReveal,
                                      duration: Duration(milliseconds: 400));
                                  break;
                                case 2:
                                  btnclicksPLY();
                                  Get.off(() => ForestView2(),
                                      transition: Transition.circularReveal,
                                      duration: Duration(milliseconds: 400));
                                  break;
                                case 3:
                                  btnclicksPLY();
                                 /* _rewardedAd.show(onUserEarnedReward: (ad, reward) {
                                    print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
                                  },);
                                 */ // _loadRewardedAd();
                                  Get.off(() => DesertView(),
                                      transition: Transition.circularReveal,
                                      duration: Duration(milliseconds: 400));
                                  break;

                                case 4:
                                  btnclicksPLY();
                                  if(_isInterstitialAdReady){
                                    _interstitialAd?.show();
                                    _loadInterstitialAd();
                                  }

                                  // _loadRewardedAd();
                                  backgroungplayer.pause();
                                  Get.off(() => OceanView(),
                                      transition: Transition.circularReveal,
                                      duration: Duration(milliseconds: 400));
                                  break;

                                case 5:
                                  btnclicksPLY();
                                  if(_isInterstitialAdReady2){
                                    _loadInterstitialAd();
                                    _interstitialAd?.show();
                                  }

                                  // _loadRewardedAd();
                                  backgroungplayer.pause();
                                  Get.off(() => SnowView(),
                                      transition: Transition.circularReveal,
                                      duration: Duration(milliseconds: 400));
                                  break;

                                default:
                                  btnclicksPLY();
                                  Get.off(() => ForestView1(),
                                      transition: Transition.circularReveal,
                                      duration: Duration(milliseconds: 400));
                                  break;
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.white, width: 4),
                              ),
                              child: Image.asset(
                                imgDash[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ),

              if (_isBannerAdReady)
                Positioned(
                    bottom: 10,
                    child: Align(alignment: Alignment.center,
                      child: Container(
                        width: ScreenUtil().screenWidth,
                        height: _bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd,),
                      ),
                    ))
            ],
          )));
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    backgroungplayer.stop();
    setState(() {});
    super.didChangeDependencies();
  }

  void _bannerAdLoad() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }
}
