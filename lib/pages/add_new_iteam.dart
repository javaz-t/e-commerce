import 'package:e_commerse/controller/home_controller.dart';
import 'package:e_commerse/widget/droup_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddNewdata extends StatelessWidget {
  const AddNewdata({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      return Scaffold(
        appBar: AppBar(title: Text('Add New Iteam '),),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(

              children: [
                Text("ADD NEW ITEAMS ", style: TextStyle(fontSize: 35,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: ctr.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    labelText: 'Product Name',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctr.descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    labelText: 'Product Description',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctr.priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    labelText: 'Price',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctr.imgUrlController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    labelText: 'Image Url',
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    DroupDown(title:ctr.catergory,
                      iteams: ['one', 'tewo', 'three'],
                      onSelected: (selectedValue) {
                      ctr.catergory=selectedValue;
                      ctr.update();
                      },
                    ),
                    DroupDown(title:ctr.brand,
                      iteams: ['one', 'tewo', 'three'],
                      onSelected: (selectedValue) {
                      ctr.brand=selectedValue;
                      ctr.update();

                      },)

                  ],
                ),
                SizedBox(height: 10,),
                Text('Offer ?', style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                DroupDown(title:ctr.offer.toString(),
                  iteams: ['true', 'false'],
                  onSelected: (selectedValue) {
                    ctr.offer=bool.tryParse(selectedValue ?? "false")?? false;
                    ctr.update();
                  },),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  ctr.addProduct();

                }, child: Text('ADD PRODUCT')),


              ],
            ),
          ),
        ),
      );
    });
  }
}
