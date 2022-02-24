import '../../constants/network/end_points.dart';
import '../../constants/network/local/cache_helper.dart';

import '../../constants/strings.dart';
import 'package:dio/dio.dart';

class Api {
  Dio? dio;
  static Map headers = <String, dynamic>{};
  Api() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //20second ,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }

  getAllCategory() async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': '',
        'Accept-Language': local.isEmpty ? 'en' : local,
      };

      Response response = await dio!.get(
        CATEGORY,
      );
      print('Data -> ${response.data.toString()}');

      return response.data;
    } catch (e) {
      print('${e.toString()}');
      return [];
    }
  }

  phoneRegister({required String phone}) async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      Response response = await dio!.post(
        PHONEREGISTER,
        data: {"mobile": phone},
      );
      return response.data;
    } catch (e) {
      print('${e.toString()}');

      return [];
    }
  }

  addToCart({required int productId, required int qty}) async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${CacheHelper.getData(key: 'token')}",
        'Accept-Language': local.isEmpty ? 'en' : local,
      };

      Response response =
          await dio!.get(ADDTOCART + '$productId', queryParameters: {
        "qty": "$qty",
      });
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('${e.toString()}');

      return [];
    }
  }

  getCart() async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${CacheHelper.getData(key: 'token')}",
        'Accept-Language': local.isEmpty ? 'en' : local,
      };

      Response response = await dio!.get(
        GETCART,
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('${e.toString()}');

      return [];
    }
  }

  delOneProCart({required int productId}) async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${CacheHelper.getData(key: 'token')}",
        'Accept-Language': local.isEmpty ? 'en' : local,
      };

      Response response = await dio!.get(
        REMOVEPRODUCT + '$productId',
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('${e.toString()}');

      return [];
    }
  }
}
