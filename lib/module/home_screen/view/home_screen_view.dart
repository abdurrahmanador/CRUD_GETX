import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../add_product/view/add_product_view.dart';
import '../controller/home_screen_controller.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    HomeScreenController controller=Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD HOME",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Obx(()=> ListView.builder(
          itemCount:controller.productList.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("${controller.productList[index].productName}"),
              subtitle: Text("${controller.productList[index].totalPrice}"),
              trailing: IconButton(
                onPressed: (){
                  controller.deleteProduct(controller.productList[index].sId!!);
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=>AddProdcutView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
