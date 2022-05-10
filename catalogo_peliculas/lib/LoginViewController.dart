import 'package:catalogo_peliculas/HomeViewController.dart';
import 'package:catalogo_peliculas/SearchMovieViewController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginViewController extends StatelessWidget {
  final usuario = TextEditingController();
  final pass = TextEditingController();

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
              campoUser(usuario),
              campoTextPass(),
              campoPass(pass),
              SizedBox(height: 15,),
              buttonVerify(context, usuario, pass)
            ],
          ),
        ),
      ),
    );
  }
}

Widget campoUser(TextEditingController usuario){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    child: TextField(
      controller: usuario,
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoPass(TextEditingController pass) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    child: TextField(
      controller: pass,
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

Widget buttonVerify(BuildContext myContext,TextEditingController usuario, TextEditingController password){
  return FlatButton(
      color: Colors.black38,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      onPressed: (){
        //Navigator.pop(myContext);
        getUsers(usuario.text, password.text, myContext);
      },
      child: Text(
        "Iniciar sesión",
        style: TextStyle(fontSize: 25, color: Colors.white),
      )
  );
}

void getUsers(String email, String password, BuildContext context) async{
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("users");
  QuerySnapshot users = await collectionReference.get();
  if(users.docs.length != 0){
    List usuarios = [];
    for(var doc in users.docs){
      usuarios.add(doc.data());
    }
    for(var user in usuarios){
      if(user['email'] == email && user['password'] == password){
        print('Bienvenido');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchViewController()),
        );
        return;
      }
    }
  }
}