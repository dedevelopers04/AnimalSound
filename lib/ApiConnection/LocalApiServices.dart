
import 'package:animal_sound/Model/Forest1Model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Forest1ApiController extends GetxController {

  static Forest1ApiController _instance = Forest1ApiController.internal();
  Forest1ApiController.internal();
  factory Forest1ApiController() => _instance;
  static http.Response? response;

  @override
  void onInit() {
    getForest1data();
    super.onInit();
  }

  Rxn<Forest1Model> _forest1data=Rxn<Forest1Model>(Forest1Model(items: [])).obs.value;
Rxn<Forest1Model> get forest1data=>_forest1data;

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }



  void getForest1data() async {
    showLoading();
    try{
      final String response =
      await rootBundle.loadString('assets/JsonLocal/Forest1.json');
        final data = await forest1ModelFromJson(response);
        print(data);
        _forest1data.value=data;

    }
    catch(e){
      hideLoading();
    }
    hideLoading();

  }
}