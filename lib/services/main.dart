import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_redux/constants/config.dart';
import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';
import 'package:flutter_app_redux/redux/reducers/main.dart';
import 'package:flutter_app_redux/services/todo_detail_repository.dart';
import 'package:flutter_app_redux/services/todo_list_repository.dart';
import 'package:flutter_app_redux/utils/datetime_util.dart';
import 'package:flutter_app_redux/utils/print_util.dart';

class Services {
  static final defaultCode = '-1';
  static final requestMinThreshold = 500;
  static final _options = Options(
    baseUrl: Config.baseUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );

  static final rest = Dio(_options);

  /// common function for network with dio
  /// Future<Response> apiFuture [Dio.request]
  /// request action
  /// success action
  /// failure action
  static asyncRequest(
    Future<Response> Function() apiFuture,
    dynamic request,
    dynamic Function(dynamic) success,
    dynamic Function(RequestFailureInfo) failure,
  ) async {
    StoreContainer.global.dispatch(request);
    final requestBegin = DateTimeUtil.dateTimeNowMilli();
    try {
      PrintUtil.print('');
      PrintUtil.print(
          '======================  START  =============================================================================================');
      PrintUtil.print('');
      final response = await apiFuture();
      if (response.request != null) {
        PrintUtil.print(response.request.baseUrl +
            response.request.path); // 下载的request为null
        if (response.request.data != null)
          PrintUtil.print(response.request.data.toString());
      }
      PrintUtil.print('${response.statusCode}');
      PrintUtil.print('${response.headers}');
      PrintUtil.print('');
      PrintUtil.print(
          '**************************************************************************************************************************************************************************');
      PrintUtil.print('');
      PrintUtil.print('${response.data}');
      PrintUtil.print('');
      PrintUtil.print(
          '**************************************************************************************************************************************************************************');
      PrintUtil.print('');

      final requestEnd = DateTimeUtil.dateTimeNowMilli();
      final requestSpend = requestEnd - requestBegin;
      if (requestSpend < requestMinThreshold) {
        await Future.delayed(Duration(
            milliseconds:
                requestMinThreshold - requestSpend)); // 请求返回太快，页面有点卡顿，有点尴尬 todo
      }
      PrintUtil.print(
          '==================  ${success(response.data).runtimeType}  ====  END  ===============================================================================================');
      PrintUtil.print('');
      StoreContainer.global.dispatch(success(response?.data));
    } on DioError catch (error) {
      var message = '';
      var code = '-1';
      var url = '';
      if (error.response != null) {
        var errorData = error.response.data;
        List messageList = errorData is Map<String, dynamic>
            ? ((errorData['message']) ?? [])
            : [];
        messageList
            .forEach((item) => message = message + item.toString() + ' ');
        code = error.response.statusCode.toString();
        url = error.response.request.baseUrl + error.response.request.path;
      } else {
        message = error.message;
      }
      final model = RequestFailureInfo(
          errorCode: code,
          errorMessage: message,
          dateTime: DateTimeUtil.dateTimeNowIso());
      PrintUtil.print('');
      PrintUtil.print(
          '==================  ${failure(model).runtimeType}  ====  START  =====================================================================================================');
      PrintUtil.print('');
      PrintUtil.print(url);
      PrintUtil.print('${error.type}');
      PrintUtil.print('${error.message}');
      PrintUtil.print('${error.response}');
      PrintUtil.print('${error.stackTrace}');
      PrintUtil.print('');
      PrintUtil.print(
          '==================  ${failure(model).runtimeType}  ====  END  =======================================================================================================');
      PrintUtil.print('');
      StoreContainer.global.dispatch(failure(model));
    }
  }

  static asyncMultipleRequest(
    List<Future<Response>> apiFutures,
    ActionType request,
    ActionType Function(dynamic) success,
    ActionType Function(dynamic) failure,
  ) async {
    StoreContainer.global.dispatch(request);
    try {
      List<dynamic> responses = await Future.wait(apiFutures);
      final successAction =
          success(responses.map((response) => response.data).toList());
      PrintUtil.print('');
      PrintUtil.print(
          '==================  ${successAction.runtimeType}  ====  START  ======================================================================================================');
      PrintUtil.print('');
      responses.forEach((response) {
        if (response.request != null) {
          PrintUtil.print(response.request.baseUrl +
              response.request.path); // 下载的request为null
          if (response.request.data != null)
            PrintUtil.print(response.request.data.toString());
        }
        PrintUtil.print('${response.statusCode}');
        PrintUtil.print('${response.headers}');
        PrintUtil.print('');
        PrintUtil.print(
            '**************************************************************************************************************************************************************************');
        PrintUtil.print('');
        PrintUtil.print('${response.data}');
        PrintUtil.print('');
        PrintUtil.print(
            '**************************************************************************************************************************************************************************');
        PrintUtil.print('');
      });
      PrintUtil.print('');
      PrintUtil.print(
          '==================  ${successAction.runtimeType}  ====  END  ========================================================================================================');
      PrintUtil.print('');
      StoreContainer.global.dispatch(successAction);
    } on DioError catch (error) {
      var message = '';
      var code = Services.defaultCode;
      var url = '';
      if (error.response != null) {
        var responseMessage = error.response.data['message'] ?? '';
        if (responseMessage is List) {
          responseMessage
              .forEach((item) => message = message + item.toString() + ' ');
        } else {
          message = responseMessage.toString();
        }

        code = error.response.statusCode.toString();
        url = error.response.request.baseUrl + error.response.request.path;
      }
      final model = RequestFailureInfo(
          errorCode: code,
          errorMessage: message,
          dateTime: DateTimeUtil.dateTimeNowIso());
      PrintUtil.print('');
      PrintUtil.print(
          '==================  ${failure(model).runtimeType}  ====  START  =====================================================================================================');
      PrintUtil.print('');
      PrintUtil.print(url);
      PrintUtil.print('${error.type}');
      PrintUtil.print('${error.message}');
      PrintUtil.print('${error.response}');
      PrintUtil.print('${error.stackTrace}');
      PrintUtil.print('');
      PrintUtil.print(
          '==================  ${failure(model).runtimeType}====  END  =======================================================================================================');
      PrintUtil.print('');
      StoreContainer.global.dispatch(failure(model));
    }
  }
}

class AppRepository with TodoListRepository, TodoDetailRepository {
  AppRepository();
}
