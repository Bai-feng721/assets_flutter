import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:myapp/http/api.dart';


class ApiCookie{
  static final CookieJar cookieJar = new CookieJar();
}
String getToken(){
  List<Cookie> cookies = ApiCookie.cookieJar.loadForRequest(Uri.parse(Api.BASE_URL+Api.LOGIN));
   return  cookies.length<=0?'':cookies[0].value;
}

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  CancelToken cancelToken = CancelToken();

  static HttpUtil getInstance() {
    if (null == instance) instance = HttpUtil();
    return instance;
  }

  /*
   * config it and create
   */
  HttpUtil() {

    BaseOptions options = BaseOptions(
      baseUrl: Api.BASE_URL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      receiveDataWhenStatusError: false,
      connectTimeout: 30000,
      receiveTimeout: 3000,
      headers: {
        "Authorization":getToken()==''?"":"Bearer " + getToken(),
        // "version": "1.0.0"
      },
    );
    // print('22222-${getToken()}');
    dio = Dio(options);

    //Cookie管理
    dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          print('请求之前');
          // if(getToken()=='') Navigator.pushNamed(context, '/');
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }
  /*
   * get请求
   */
  get(url, {data,token}) async {
    Response response;
    try {
      response = await dio.get(url,queryParameters: data);
      // print('get success---------${response}');
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response;
  }
  /*
   * post请求
   */
  post(url, {data}) async {
    Response response;
    try {
      response = await dio.request(url, data: data, options: Options(method:'post'));
      // print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * 下载文件
   */
  // downloadFile(urlPath, savePath) async {
  //   Response response;
  //   try {
  //     response = await dio.download(urlPath, savePath,
  //         onReceiveProgress: (int count, int total) {
  //       //进度
  //       print("$count $total");
  //     });
  //     print('downloadFile success---------${response.data}');
  //   } on DioError catch (e) {
  //     print('downloadFile error---------$e');
  //     formatError(e);
  //   }
  //   return response.data;
  // }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");

    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}