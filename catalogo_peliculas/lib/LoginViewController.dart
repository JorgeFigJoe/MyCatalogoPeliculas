import 'package:flutter/material.dart';

class LoginViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vista de login"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Regresar al HomeScreen'),
        ),
      ),
    );
  }
}