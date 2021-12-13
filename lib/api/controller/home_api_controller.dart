import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopper_project2/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shopper_project2/api/api_setting.dart';
import 'package:shopper_project2/models/api_base_response.dart';
import 'package:shopper_project2/models/category.dart';
import 'package:shopper_project2/models/contact_request.dart';
import 'package:shopper_project2/models/faq.dart';
import 'package:shopper_project2/models/home_response.dart';
class HomeApiController with ApiHelper{
  Future<HomeResponse?> showHome() async {
    var url = Uri.parse(ApiSetting.home);
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return HomeResponse.fromJson(jsonDecode(response.body)['data']);
    }
    return null;
  }
  Future<List<Category>> getCategories() async {

    var url = Uri.parse(ApiSetting.categories);

    var response = await http.get(url);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {

      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;

      return categoriesJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();



    }
    return [];
  }
  Future<List<FAQL>> getFaq() async {
    var url = Uri.parse(ApiSetting.faq);
    var response = await http.get(url);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      var faqJsonArray = jsonDecode(response.body)['list'] as List;

      return faqJsonArray
          .map((jsonObject) => FAQL.fromJson(jsonObject))
          .toList();



    }
    return [];
  }



  Future<bool> contactRequest(BuildContext context,
      {required ContactRequestModel contactRequest}) async {
    var url = Uri.parse(ApiSetting.contactRequest);

    var response = await http.post(url, body: {
      'subject': contactRequest.subject,
      'message':contactRequest.message,


    });
    if (response.statusCode == 201) {

      var contactRequest = ContactRequestModel.fromJson(jsonDecode(response.body));
      showSnackBar(context, message: contactRequest.message);
      return true;
    } else if (response.statusCode == 400) {

      var message = jsonDecode(response.body)['message'];
      showSnackBar(context, message: message, error: true);

    }else{
      showSnackBar(context, message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }

// get favorite product
// add to favorite
}