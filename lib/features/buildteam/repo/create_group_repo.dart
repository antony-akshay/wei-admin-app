import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wei_admin/core/api_endpoints.dart';
import 'package:wei_admin/core/constants.dart';

class CreateGroupRepo {
  static final _dio = Dio();

  static passwordReset(String pw, String userId) async {
    try {
      log("forgotPassword:email sending...");
      print("pw:$pw userid:$userId");
      final response = await _dio.post(
        ApiEndpoints.resetPassword,
        data: {"userId": userId, "newPassword": pw},
      );
      final data = response.data;
      print("data is $data");
      log(data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("success : $response");
        return true;
      } else if (response.statusCode == 400) {
        return false;
      }
    } on DioException catch (e) {
      log(e.toString());
      log(e.response.toString());
    }
  }

  static Future<bool> admin_createGroup({
    required String grpType,
    // Common fields
    required String panNo,
    String? gstNo, // optional
    required String primaryBankAccType,
    required String primaryBankAccNo,
    required String primaryBankIfsc,
    required String primaryBankAccHolder,

    // Admin group optional files
    MultipartFile? idProof,
    MultipartFile? bankCheck,

    // Org-specific fields
    String? name,
    String? email,
    String? contactNo,
    String? address,
    String? organisationType,

    MultipartFile? companyCertificate,
    MultipartFile? companyLogo,
  }) async {
    try {
      final formData = FormData.fromMap({
        "grp_type": grpType,
        "pan_no": panNo,
        if (gstNo != null && gstNo.isNotEmpty) "gst_no": gstNo,
        "primary_bank_acc_type": primaryBankAccType,
        "primary_bank_acc_no": primaryBankAccNo,
        "primary_bank_ifsc": primaryBankIfsc,
        "primary_bank_acc_holder": primaryBankAccHolder,

        // Files
        if (idProof != null) "id_proof": idProof,
        if (bankCheck != null) "bank_check": bankCheck,

        // Org group only
        if (grpType == "organisation") ...{
          "name": name,
          "email": email,
          "contact_no": contactNo,
          "address": address,
          "organisation_type": organisationType,
          if (companyCertificate != null)
            "company_certificate": companyCertificate,
          if (companyLogo != null) "company_logo": companyLogo,
        },
      });

      final response = await _dio.post(
        ApiEndpoints.createGroup,
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer YOUR_ADMIN_JWT_TOKEN",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      final data = response.data;
      print("data is $data");
      log(data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("success : $response");
        return true;
      } else if (response.statusCode == 400) {
        return false;
      }
    } on DioException catch (e) {
      print("Error: $e");
      return false;
    }
    return false;
  }

  static admin_createOrgGroup() async {}

  static org_createAdminGroup() async {}

  static org_createOrgGroup() async {}
}
