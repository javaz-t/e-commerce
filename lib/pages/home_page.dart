import 'package:e_commerse/controller/home_controller.dart';
import 'package:e_commerse/pages/add_new_iteam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: () {
            Get.to(() => AddNewdata());
          },),
          appBar: AppBar(title: Text('Product List'),),
          body: ListView.builder(itemCount: 6, itemBuilder: (context, index) {
            return Card(
              child: ListTile(title: Text('Name'),
                subtitle: Text('Price :345'),
                trailing: IconButton(onPressed: () {
                  ctr.testMethod();
                }, icon: Icon(Icons.delete),),),
            );
          })
      );
    });
  }
}
