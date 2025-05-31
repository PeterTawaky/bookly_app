import 'package:bookly_app/core/api/local_status_codes.dart';
import 'package:bookly_app/core/api/api_error_model.dart';
import 'package:flutter/material.dart';

class ApiErrorFactory {
  static ApiErrorModel get defaultError => ApiErrorModel(
    message: "Something went wrong",
    icon: Icons.error,
    statusCode: LocalStatusCodes.defaultError,
  );
  static ApiErrorModel get badResponseWithoutCode => ApiErrorModel(
    //when the server doesn't send status code in the response
    message: "Something went wrong",
    icon: Icons.error,
    statusCode: LocalStatusCodes.badResponse,
  );
}
