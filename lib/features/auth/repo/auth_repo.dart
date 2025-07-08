import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wei_admin/core/api_endpoints.dart';
import 'package:wei_admin/core/constants.dart';

class AuthRepo {
  static final _dio = Dio();

  static adminSignup(
    String fullName,
    String email,
    String contactNumber,
    String password,
  ) async {
    try {
      log("Trying to signup");
      final response = await _dio.post(
        "$baseUrl${ApiEndpoints.adminSignup}",
        data: {
          "name": fullName,
          "email": email,
          "contact_no": contactNumber,
          "password": password,
        },
      );
      final data = response.data;
      log(data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } on DioException catch (e) {
      log(e.toString());
      log(e.response.toString());
    }
  }

  static organizationSignup(
    String organisationName,
    String email,
    String contactNumber,
    String password,
    String organisationType,
    String address,
  ) async {
    try {
      log("Trying to signup");
      final response = await _dio.post(
        "$baseUrl${ApiEndpoints.adminSignup}",
        data: {
          "name": organisationName,
          "email": email,
          "contact_no": contactNumber,
          "password": password,
          "organisation_type": organisationType,
          "address": address,
        },
      );
      final data = response.data;
      log(data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } on DioException catch (e) {
      log(e.toString());
      log(e.response.toString());
    }
  }
}
