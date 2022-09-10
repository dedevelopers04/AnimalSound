import 'dart:convert';

import 'package:animal_sound/ApiConnection/EndPoints.dart';
import 'package:animal_sound/ApiConnection/HttpApiService.dart';
import 'package:animal_sound/Config/config.dart';
import 'package:animal_sound/Model/FarmModel.dart';
import 'package:animal_sound/Model/Jungle1Model.dart';
import 'package:animal_sound/Model/forest2model.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:dio/dio.dart' as dioResponse;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ThirdCategoryControllers extends GetxController {
  static dioResponse.Response? response;

  // HttpApiService _httpApiService = HttpApiService();

  @override
  void onInit() {
    getforest2dataApi();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  hideLoading() {
    isLoading.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }

  Rxn<ThirdCategory> _getforest2data = Rxn<ThirdCategory>().obs.value;

  Rxn<ThirdCategory> get getforest2data => this._getforest2data;

  void getforest2dataApi() async {
    showLoading();
    final client = Dio(BaseOptions(responseType: ResponseType.plain));

    try {
      response =
          await client.post("${Config.baseUrl + EndPoints.jungleTwoCatagory}");
      if (response!.statusCode == 200) {
        final jasonDecode =
        ThirdCategory.fromJson(json.decode(response!.data.toString()));
        _getforest2data.value=jasonDecode;
      }
    } catch (e) {
      print(e);
      hideLoading();
    }
    hideLoading();
  }
}
