import 'dart:developer';

import 'package:dio/dio.dart';

class DioExample {
  /// Get Method Dio
  getRequest() async {
    Dio _dio = Dio();
    try {
      /// 400 - 599 Actual Error (500 - 599 server side error)
      /// 300 - 399 Redirect to other link
      /// 200 - 299 Success
      /// 100 - 199 Information
      Response response = await _dio.get(
        'https://nexus.rollingnexus.com/api/service-types',
      );
      log(response.statusCode.toString(), name: 'API Response Data');
      log(response.statusMessage.toString(), name: 'API Response Data');
      log(response.data.toString(), name: 'API Response Data');
    } on DioError catch (e) {
      log(e.response!.statusCode.toString(), name: 'API Response Error');
      log(e.response!.statusMessage.toString(), name: 'API Response Error');
    } on Exception catch (e) {
      log(e.toString(), name: 'General Error');
    }
  }

  postRequest() async {
    Dio _dio = Dio();
    try {
      /// 400 - 599 Actual Error (500 - 599 server side error)
      /// 300 - 399 Redirect to other link
      /// 200 - 299 Success
      /// 100 - 199 Information
      Response response = await _dio.post(
        'https://nexus.rollingnexus.com/api/service-types',
        data: {
          "page": 1,
        },
      );
      log(response.statusCode.toString(), name: 'API Response Data');
      log(response.statusMessage.toString(), name: 'API Response Data');
      log(response.data.toString(), name: 'API Response Data');
    } on DioError catch (e) {
      log(e.response!.statusCode.toString(), name: 'API Response Error');
      log(e.response!.statusMessage.toString(), name: 'API Response Error');
    } on Exception catch (e) {
      log(e.toString(), name: 'General Error');
    }
  }
}
