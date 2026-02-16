import 'package:flutter/foundation.dart';

class CustomError {
  final String code;
  final String message;
  final String plugin;

  CustomError({
    required this.code,
    required this.message,
    required this.plugin,
  });
  

   factory CustomError.fromJson(JsonData)
  {
    return CustomError(code: JsonData, message: JsonData, plugin: JsonData);
  }
}
