import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerse/model/product/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Product> products = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference
      productCollection; //productCollection is likely a CollectionReference pointing to a collection in your Firestore database
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();
  String catergory = 'catergory';
  String brand = 'brand';
  bool offer = false;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    productCollection = firestore.collection('products');
   await fetchProducts();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection
          .doc(); //doc() is a method that generates a new, auto-generated ID in this collection. DocumentReference doc = productCollection.doc(); creates a new document reference with an auto-generated ID in the productCollection collection, and assigns this reference to doc
      Product product = Product(
        name: nameController.text,
        brand: brand,
        category: catergory,
        description: descriptionController.text,
        imageUrl: imgUrlController.text,
        offer: offer,
        price: double.tryParse(priceController.text) ?? 0,
        id: doc.id,
      );
      Get.back();      final productJson = product.toJson();
      doc.set(
          productJson); //set is a method that writes or replaces data on a specific document referenced by DocumentReference.
      Get.snackbar('Sucess', 'everything perfect');
}catch (e) {
      Get.snackbar('Error', e.toString());
      print(e);
    }finally{
fetchProducts();}
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);

      Get.snackbar('Success', 'Product fetch successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }finally{  update();
  }
  }

deleteProduce(String id){ try{ productCollection.doc(id).delete();     Get.snackbar('Success', 'Product Deleted',
    colorText: Colors.green); fetchProducts();
}catch(e){  Get.snackbar('Error', e.toString(), colorText: Colors.red);
print(e);
}
}
///clear controller data when add product clicked
}