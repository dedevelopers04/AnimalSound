import 'dart:convert';

import 'package:animal_sound/ApiConnection/EndPoints.dart';
import 'package:animal_sound/ApiConnection/HttpApiService.dart';
import 'package:animal_sound/Config/config.dart';
import 'package:animal_sound/Model/FarmModel.dart';
import 'package:animal_sound/Model/Jungle1Model.dart';
import 'package:animal_sound/Model/WaterAnimalModel.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:animal_sound/Widget/ConvertUrlToByes.dart';
import 'package:dio/dio.dart' as dioResponse;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ForthCategoryController extends GetxController {
  static dioResponse.Response? response;

  // HttpApiService _httpApiService = HttpApiService();

  @override
  void onInit() {
    getwaterAnimalDataApi();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  hideLoading() {
    isLoading.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }

  Rxn<WaterAnimalModel> _getwaterAnimalData = Rxn<WaterAnimalModel>().obs.value;

  Rxn<WaterAnimalModel> get getwaterAnimalData => this._getwaterAnimalData;

  void getwaterAnimalDataApi() async {
    showLoading();
    final client = Dio(BaseOptions(responseType: ResponseType.plain));

    try {
      response =
      await client.post("${Config.baseUrl + EndPoints.waterAnimalsCategory}");
      if (response!.statusCode == 200) {
        final jasonDecode =
        WaterAnimalModel.fromJson(json.decode(response!.data.toString()));
        _getwaterAnimalData.value=jasonDecode;


      }
    } catch (e) {
      print(e);
      hideLoading();
    }
    hideLoading();
  }
}
