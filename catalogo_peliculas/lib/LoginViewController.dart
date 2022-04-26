import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginViewController extends StatelessWidget {

  @override
  void initState(){
    //super.initState();
    getUsers();
  }

  void getUsers() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("users");
    QuerySnapshot users = await collectionReference.get();
    if(users.docs.length != 0){
      for(var doc in users.docs){
        print(doc.data());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vista de login"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Navigator.pop(context);
            getUsers();
          },
          child: Text('Regresar al HomeScreen'),
        ),
      ),
    );
  }
}