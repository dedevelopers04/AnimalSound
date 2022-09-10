import 'dart:convert';

import 'package:animal_sound/ApiConnection/EndPoints.dart';
import 'package:animal_sound/ApiConnection/HttpApiService.dart';
import 'package:animal_sound/Config/config.dart';
import 'package:animal_sound/Model/FarmModel.dart';
import 'package:dio/dio.dart' as dioResponse;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SecondCategoryController extends GetxController {
  static dioResponse.Response? response;

  // HttpApiService _httpApiService = HttpApiService();

  @override
  void onInit() {
    getfarmDataApi();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  hideLoading() {
    isLoading.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }

  Rxn<SecondCategory> _getFarmData = Rxn<SecondCategory>().obs.value;

  Rxn<SecondCategory> get getFarmData => this._getFarmData;

  void getfarmDataApi() async {
    showLoading();
    final client = Dio(BaseOptions(responseType: ResponseType.plain));

    try {
      response =
          await client.post("${Config.baseUrl + EndPoints.farmCatagory}");
      if (response!.statusCode == 200) {
        final jasonDecode = SecondCategory.fromJson(json.decode(response!.data.toString()));
        _getFarmData.value=jasonDecode;


      }
    } catch (e) {
      print(e);
      hideLoading();
    }
    hideLoading();
  }
}
