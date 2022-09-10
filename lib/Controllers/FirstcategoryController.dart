import 'dart:convert';

import 'package:animal_sound/ApiConnection/EndPoints.dart';
import 'package:animal_sound/ApiConnection/HttpApiService.dart';
import 'package:animal_sound/Config/config.dart';
import 'package:animal_sound/Model/Jungle1Model.dart';
import 'package:animal_sound/Model/imageModelAsset.dart';
import 'package:dio/dio.dart' as dioResponse;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FirstCategoryController extends GetxController {
  static dioResponse.Response? response;

  // HttpApiService _httpApiService = HttpApiService();

  @override
  void onInit() {
    getJungleOneList();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  hideLoading() {
    isLoading.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }

  Rxn<FirstCategory> _getJungleOneData = Rxn<FirstCategory>().obs.value;

  Rxn<FirstCategory> get getJungleOneData => this._getJungleOneData;

  void getJungleOneList() async {
    showLoading();
    final client = Dio(BaseOptions(responseType: ResponseType.plain));

    try {
      response =
          await client.post("${Config.baseUrl + EndPoints.jungleOneCatagory}");
      if (response!.statusCode == 200) {
        final jasonDecode =
            FirstCategory.fromJson(json.decode(response!.data.toString()));
        _getJungleOneData.value=jasonDecode;
      }
    } catch (e) {
      print(e);
      hideLoading();
    }
    hideLoading();
  }
}
