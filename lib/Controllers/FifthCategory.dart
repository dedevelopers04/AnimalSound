import 'dart:convert';

import 'package:animal_sound/ApiConnection/EndPoints.dart';
import 'package:animal_sound/ApiConnection/HttpApiService.dart';
import 'package:animal_sound/Config/config.dart';
import 'package:animal_sound/Model/DesertModel.dart';
import 'package:animal_sound/Model/FarmModel.dart';
import 'package:animal_sound/Model/Jungle1Model.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Widget/ConvertUrlToByes.dart';
import 'package:dio/dio.dart' as dioResponse;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FifthCategoryController extends GetxController {
  static dioResponse.Response? response;

  // HttpApiService _httpApiService = HttpApiService();

  @override
  void onInit() {
    getDesertDataApi();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  hideLoading() {
    isLoading.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }

  Rxn<DesertModel> _getDesertData = Rxn<DesertModel>().obs.value;

  Rxn<DesertModel> get getDesertData => this._getDesertData;

  void getDesertDataApi() async {
    showLoading();
    final client = Dio(BaseOptions(responseType: ResponseType.plain));

    try {
      response =
          await client.post("${Config.baseUrl + EndPoints.desertCategory}");
      if (response!.statusCode == 200) {
        final jasonDecode =
        DesertModel.fromJson(json.decode(response!.data.toString()));
        _getDesertData.value=jasonDecode;

      }
    } catch (e) {
      print(e);
      hideLoading();
    }
    hideLoading();
  }
}
