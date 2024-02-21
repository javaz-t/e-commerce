import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class OrderedPage extends StatelessWidget {
  const OrderedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference orderedProduct = FirebaseFirestore.instance.collection('order');
    return  Scaffold(
      appBar: AppBar(title: Text('Ordered Produts '),),
    body:StreamBuilder(stream: orderedProduct.snapshots(),builder: (context, snapshot) {
      if(snapshot.hasData){
        int count = snapshot.data!.size;
        return ListView.builder(itemCount:count ,itemBuilder: (context,index){
          final DocumentSnapshot data = snapshot.data!.docs[index];
          return Card(
            child: ListTile(
              title: Text('Name : ${data['customer']}  ,Product : ${data['iteam']}'),
              subtitle: Text('Address :${data['address']} , Translation Id : ${data['transationId']}',
              ),
            ),

          );

        });
      }
      return const SizedBox();
    },)

    );
  }
}
