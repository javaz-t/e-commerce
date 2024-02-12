import 'package:e_commerse/controller/home_controller.dart';
import 'package:e_commerse/widget/droup_down.dart';
import 'package:flutter/material.dart';
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
                    DroupDown(title: 'Catergory ',
                      iteams: ['one', 'tewo', 'three'],
                      onSelected: (selectedValue) {
                        print(selectedValue);
                      },),
                    DroupDown(title: 'Brand ',
                      iteams: ['one', 'tewo', 'three'],
                      onSelected: (selectedValue) {
                        print(selectedValue);
                      },)

                  ],
                ),
                SizedBox(height: 10,),
                Text('Offer ?', style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                DroupDown(title: ' ',
                  iteams: ['YES', 'NO'],
                  onSelected: (selectedValue) {
                    print(selectedValue);
                  },),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {}, child: Text('ADD PRODUCT')),


              ],
            ),
          ),
        ),
      );
    });
  }
}
