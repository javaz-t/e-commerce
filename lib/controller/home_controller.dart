
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  String test='test';
  FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;
  late CollectionReference productCollection; //productCollection is likely a CollectionReference pointing to a collection in your Firestore database

@override
  void onInit() {
    // TODO: implement onInit
  productCollection = firebaseFirestore.collection('products');
    super.onInit();
  }

   testMethod(){
    print(test);
  }

 addProduct(){
  DocumentReference doc = productCollection.doc(); //doc() is a method that generates a new, auto-generated ID in this collection. DocumentReference doc = productCollection.doc(); creates a new document reference with an auto-generated ID in the productCollection collection, and assigns this reference to doc
}
}