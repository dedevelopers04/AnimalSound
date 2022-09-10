import 'dart:convert';

import 'package:animal_sound/ApiConnection/EndPoints.dart';
import 'package:animal_sound/ApiConnection/HttpApiService.dart';
import 'package:animal_sound/Config/config.dart';
import 'package:animal_sound/Model/FarmModel.dart';
import 'package:animal_sound/Model/Jungle1Model.dart';
import 'package:animal_sound/Model/SnowModel.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Widget/ConvertUrlToByes.dart';
import 'package:dio/dio.dart' as dioResponse;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SixCategoryController extends GetxController {
  static dioResponse.Response? response;

  // HttpApiService _httpApiService = HttpApiService();

  @override
  void onInit() {
    getSnowDataApi();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  hideLoading() {
    isLoading.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }

  Rxn<SnowModel> _getSnowData = Rxn<SnowModel>().obs.value;

  Rxn<SnowModel> get getSnowData => this._getSnowData;

  void getSnowDataApi() async {
    showLoading();
    final client = Dio(BaseOptions(responseType: ResponseType.plain));

    try {
      response =
          await client.post("${Config.baseUrl + EndPoints.snowCategory}");
      if (response!.statusCode == 200) {
        final jasonDecode =
        SnowModel.fromJson(json.decode(response!.data.toString()));
        _getSnowData.value=jasonDecode;


      }
    } catch (e) {
      print(e);
      hideLoading();
    }
    hideLoading();
  }
}
