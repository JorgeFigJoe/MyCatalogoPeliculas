import 'package:catalogo_peliculas/CreateAccountViewContrroller.dart';
import 'package:catalogo_peliculas/LoginViewController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
// Replace with actual values
    options: const FirebaseOptions(
      apiKey: "XXX",
      appId: "1:93762009077:android:aaf0ec6e0b5bc209c592bc",
      messagingSenderId: "XXX",
      projectId: "catalogopeliculassfje",
    ),
  );
  runApp(MaterialApp(
    title: 'Catalogo de peliculas',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi catalogo de peliculas'),
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
              Column(
                children: <Widget>[
                  Text('Bienvenido a tu catalogo de peliculas',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white)),
                ],
              ),
              Accounts()
            ],
          ),
        ),
      ),
    );
  }
}

class Accounts extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: RaisedButton(
            child: Text('Iniciar sesion'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginViewController()),
              );
            },
          ),
        ),
        Container(
          child: RaisedButton(
            child: Text('Crear una cuenta nueva'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateAccountViewController()),
              );
            },
          ),
        )
      ],
    );
  }
}

