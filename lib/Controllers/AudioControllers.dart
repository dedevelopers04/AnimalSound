
import 'package:get/get.dart';

class AudioControllers extends GetxController{
  @override
  void onInit() {

    super.onInit();
  }
  RxBool isLoading = false.obs;
  //AssetsAudioPlayer audioPlayer=AssetsAudioPlayer();


  Rxn<String>_setaudioInController =Rxn<String>().obs.value;

  set setaudioInController(String audiodata){
    print(audiodata);
  //  _setaudioInController=audiodata;
  // audioPlayer.open(Audio.file(audiodata),autoStart: false,showNotification: false);

    notifyChildrens();
  }

  void playingController(){


  }
  hideLoading() {
    isLoading.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }

}