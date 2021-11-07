import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kickstarter/service/z_imports_services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/dialog/z_imports_dialog.dart';

class ApiBaseHelper {
  bool? isHeader;

  Future<dynamic> get(BuildContext context, String url) async {
    dynamic responseJson;
    dynamic response;

    try {
      response = await http.get(Uri.parse(ApiConstants.baseURL + url), headers: {"app-id": "0JyYiOQXQQr5H9OEn21312"});
      responseJson = _returnResponse(context, response);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> post(BuildContext context, String url, dynamic body) async {
    dynamic responseJson;
    dynamic response;

    try {
      response = await http
          .post(Uri.parse(ApiConstants.baseURL + url), body: body, headers: {"app-id": "0JyYiOQXQQr5H9OEn21312"});

      responseJson = _returnResponse(context, response);
    } on SocketException {
      DialogHelper().showMessage(context, AppConstants.appName, "Internet is not connected.", () {
        Navigator.pop(context);
      });
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }
}

dynamic _returnResponse(BuildContext context, http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
