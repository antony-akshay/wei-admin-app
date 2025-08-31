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
      log("organisation type :$organisationType");
      final response = await _dio.post(
        "$baseUrl${ApiEndpoints.organizationSignup}",
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

  static verifyOtp(String email, String contactNumber, String otp) async {
    try {
      log("Verifying otp");
      final response = await _dio.post(
        "$baseUrl${ApiEndpoints.verifyOtp}",
        data: {"email": email, "contact_no": contactNumber, "otp": otp},
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

  static forgotPWSendIdentifer(String identifier) async{
    try{
      log("forgotPassword:email sending...");
      final response = await _dio.post(
        ApiEndpoints.forgotPasswordSendEmail,
        data: {"email": identifier},
      );
      final data = response.data;
      log(data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } on DioException catch(e){
      log(e.toString());
      log(e.response.toString());
    }
  }

  static verifyForgotPasswordOTP(String otp,String email) async{
    try{
      log("forgotPassword:email sending...");
      final response = await _dio.post(
        ApiEndpoints.verifyForgotPasswordOTP,
        data: {"email": email,"pin":otp},
      );
      final data = response.data;
      log(data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }else if(response.statusCode == 400){
        if(data['message'] == "Invalid OTP"){
          log("invalid otp");
        }
        if(data['message'] == "User not found"){
          log("invalid otp");
        }
        return false;
      }
    } on DioException catch(e){
      log(e.toString());
      log(e.response.toString());
    }
  }
}
