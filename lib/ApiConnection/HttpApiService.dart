
import 'package:animal_sound/Config/config.dart';
import 'package:dio/dio.dart';

import 'DioException.dart';

class HttpApiService {
  static HttpApiService _instance = HttpApiService.internal();
  HttpApiService.internal();
  factory HttpApiService() => _instance;
  static Dio? dio;
  static Response? response;
  // final authController = getx.Get.find();
  //final AuthController authController = getx.Get.find<AuthController>();
  String token = '';
// base setup dio..
  static Dio getClient() {
    if (dio == null) {
      BaseOptions baseOptions = BaseOptions(
          baseUrl: Config.baseUrl,
          responseType: ResponseType.json,
          connectTimeout: 400000,
          headers: {
            "Accept": "application/json"
            //'x-auth-token': _token,
          },
          contentType: "application/json");

      dio = Dio(baseOptions);
      // dio.interceptors.add(InterceptorsWrapper(
      //     onError: (error, errorInterceptorHandler) {
      //       print(error.toString());
      //     },
      //     onRequest: (requestOptions, requestInterceptorHandler) {},
      //     onResponse: (onresponse, responseInterceptorHandler) {
      //       print(onresponse.statusCode.toString());
      //     }));
    }

    return dio!;
  }



  Future<dynamic> getDataV3(
      {String? endPointUrl,
        Map<String, dynamic>? queryParameters,
        isToken = false}) async {
    Map<String, dynamic> headers;
    if (!isToken) {
      headers = {
        "Accept": "application/json",
      };
    } else {
      headers = {
        "Accept": "application/json",
        "Authorization": 'Bearer ' + token
      };
    }

    try {
      response = await HttpApiService.getClient().get("$endPointUrl",
          //queryParameters: queryParameters,
          );
      if (response!.statusCode == 200 || response!.statusCode == 201) {
        return response;
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }

    return response;
  }


  // post
  Future<Response> postDataV3(
      {String? endPointUrl, isToken = false}) async {
    print("CAll API WITH THE THIS TOKEN:-\n");
    print(token);
    Map<String, dynamic> headers;
    if (!isToken) {
      headers = {
        "Accept": "application/json",
      };
    } else {
      headers = {
        "Accept": "application/json",
        "Authorization": 'Bearer ' + token
      };
    }

    try {
      response = await HttpApiService.getClient().post("$endPointUrl",);

      if (response!.statusCode == 200 || response!.statusCode == 201) {
        //var decodedJson = jsonDecode(response.data);
        return response!;
        // var data =
        //     (response.data as List).map((e) => Category.fromJson(e)).toList();
        // print(data.length);
      }
    } catch (e) {
      print(e);
    }

    return response!;

  }

}