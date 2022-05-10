import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateAccountViewController extends StatelessWidget {
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
        title: Text("Iniciar sesión"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://thumbs.dreamstime.com/b/fondo-de-la-turquesa-página-del-cómic-120800082.jpg"),
                fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              campoText(),
              campoUser(),
              campoTextPass(),
              campoPass(),
              SizedBox(height: 15,),
              buttonVerify(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget campoUser(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoPass() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoText(){
  return Text("Ingrese nombre de usuario", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),);
}

Widget campoTextPass(){
  return Text("Ingrese la contraseña", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),);
}

Widget buttonVerify(BuildContext myContext){
  return FlatButton(
      color: Colors.black38,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      onPressed: (){
        Navigator.pop(myContext);
      },
      child: Text(
        "Crear nueva cuenta",
        style: TextStyle(fontSize: 25, color: Colors.white),
      )
  );
}