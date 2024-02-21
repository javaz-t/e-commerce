import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerse/controller/home_controller.dart';
import 'package:e_commerse/pages/add_new_iteam.dart';
import 'package:e_commerse/pages/ordered_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
final CollectionReference  addedDetails = FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),

          onPressed: () {
            Get.to(() => AddNewdata());
          },
        ),
        appBar: AppBar(
          actions: [
            ElevatedButton(onPressed: (){ Get.to(()=>OrderedPage());}, child: Text('Ordered Product'))
          ],
          title: Text('Product List'),
        ),
        body:
            ListView.builder(
                        itemCount: ctr.products.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(ctr.products[index].name),
                              subtitle: Text(ctr.products[index].price.toString()),
                              trailing: IconButton(
                                onPressed: () { ctr.deleteProduce(ctr.products[index].id.toString()); },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          );
                        }),



      );
    });
  }
}
