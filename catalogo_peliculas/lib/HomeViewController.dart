import 'package:catalogo_peliculas/SearchMovieViewController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewController extends StatelessWidget {
  final String emailUser;

  HomeViewController({
    required this.emailUser
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido: "+emailUser),
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
              buttonVerify(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buttonVerify(BuildContext myContext){
  return FlatButton(
      color: Colors.black38,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      onPressed: (){
        Navigator.push(
          myContext,
          MaterialPageRoute(builder: (context) => SearchViewController()),
        );
      },
      child: Text(
        "Ver catalogo",
        style: TextStyle(fontSize: 25, color: Colors.white),
      )
  );
}





