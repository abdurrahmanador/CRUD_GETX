import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../home_screen/controller/home_screen_controller.dart';
import '../model/add_product_data.dart';

class AddProdcutController extends GetxController {

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
  }


  Future<void> addProduct() async {
    final url = "https://crud.teamrabbil.com/api/v1/CreateProduct";
    var uri = Uri.parse(url);

    try {
      final result = await http.post(uri,  headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },  body: jsonEncode({
        "Img": imgTEController.text,
        "ProductCode": productCodeTEController.text,
        "ProductName": productNameTEController.text,
        "Qty": qtyTEController.text,
        "TotalPrice": totalPriceTEController.text,
        "UnitPrice": unitPriceTEController.text
      }
      ));

      if (result.statusCode == 200) {
        isLoading.value = false;
        print("Product added successfully");
        // Optionally, you can reload the product list after adding
        Get.find<HomeScreenController>().getProductData();
      } else {
        print("Failed to Post data: ${result.statusCode}");
        isLoading.value = false;
      }
    } catch (e) {
      print("Error: $e");
      isLoading.value = false;
    }
  }


}
