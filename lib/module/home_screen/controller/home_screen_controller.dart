import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/home_screen_data.dart';

class HomeScreenController extends GetxController {

  var productList = <Data>[].obs;
  RxBool isLoading = true.obs;

  TextEditingController imgTEController = TextEditingController();
  TextEditingController productCodeTEController = TextEditingController();
  TextEditingController productNameTEController = TextEditingController();
  TextEditingController qtyTEController = TextEditingController();
  TextEditingController totalPriceTEController = TextEditingController();
  TextEditingController unitPriceTEController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getProductData();

  }


  Future<void> getProductData() async {
    const url = "https://crud.teamrabbil.com/api/v1/ReadProduct";
    var uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        isLoading.value = false;
        // Parse the JSON data
        var jsonData = jsonDecode(response.body);
        var data = ProductData.fromJson(jsonData);
       // productList.value = data.data!;
        productList.assignAll(data.data!);
      } else {
        print("Failed to load data: ${response.statusCode}");
        isLoading.value = false;
      }
    } catch (e) {
      print("Error: $e");
      isLoading.value = false;
    }
  }
  Future<void> deleteProduct(String id) async {
    var url = "https://crud.teamrabbil.com/api/v1/DeleteProduct/$id";
    var uri = Uri.parse(url);

    final result = await http.get(uri);
    if (result.statusCode == 200) {
      print("Successfully Deleted");
      productList.removeWhere((product) => product.sId == id);
    } else {
      print("Failed to load data: ${result.statusCode}");
    }
  }
}
