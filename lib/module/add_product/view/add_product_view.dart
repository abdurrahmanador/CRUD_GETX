import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_product_controller.dart';

class AddProdcutView extends StatelessWidget {
  const AddProdcutView({super.key});

  @override
  Widget build(BuildContext context) {

    AddProdcutController controller=Get.put(AddProdcutController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.imgTEController,
              decoration: InputDecoration(
                  hintText: "Enter Image URL"
              ),
            ),
            TextFormField(
              controller: controller.productNameTEController,
              decoration: InputDecoration(
                  hintText: "Enter Product Name"
              ),
            ), TextFormField(
              controller: controller.productCodeTEController,
              decoration: InputDecoration(
                  hintText: "Enter ProductCode"
              ),
            ) ,TextFormField(
              controller: controller.unitPriceTEController,
              decoration: InputDecoration(
                  hintText: "Enter Unit Price"
              ),
            ) ,TextFormField(
              controller: controller.totalPriceTEController,
              decoration: InputDecoration(
                  hintText: "Enter Total Price"
              ),
            ), TextFormField(
              controller: controller.qtyTEController,
              decoration: InputDecoration(
                  hintText: "Enter Quantity"
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.addProduct();
              },
                  child: Text("Add Product "),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
