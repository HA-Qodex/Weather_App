import 'package:dio/dio.dart';

class APIRequest {
  final String url;
  final Map<String, dynamic>? payLoad;

  APIRequest(this.url, {this.payLoad});

  Dio _dio() {
    return Dio(BaseOptions(headers: {
      "authorization": "Your KEY"
    }));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError
  }) {
    _dio().get(this.url, queryParameters: this.payLoad).then((response) {
      if(onSuccess != null){
        onSuccess(response.data);
      }
    }).catchError((error){
      if (onError != null){
        onError(error);
      }
    });
  }
}