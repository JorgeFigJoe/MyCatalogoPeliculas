import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

  class DetailMovieViewControllerState extends StatelessWidget{

      final String nameMovie;
      final String imageMovie;
      final String dateMovie;
      final String directorMovie;
      final String genereMovie;
      final String sinopsisMovie;

      final String emailUser;


      DetailMovieViewControllerState({
        required this.nameMovie,
        required this.imageMovie,
        required this.dateMovie,
        required this.directorMovie,
        required this.genereMovie,
        required this.sinopsisMovie,
        required this.emailUser
      });

      @override
      Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: Text("Detalles de la pelicula: "+nameMovie),
          ),
          backgroundColor: Colors.black87,
          body: Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    addFavouriteButton(context),
                    SizedBox(height: 15,),
                    CachedNetworkImage(imageUrl: imageMovie, fit: BoxFit.cover, height: 400,),
                    Text("Titulo: "+nameMovie,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white)),
                    Text("Fecha: "+dateMovie,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                    Text("Director: "+directorMovie,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                    Text("Genero: "+genereMovie,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                    SizedBox(height: 15,),
                    Text("Sinopsis: "+sinopsisMovie,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        );
      }

      Widget addFavouriteButton(BuildContext myContext){
        return FlatButton(
            color: Colors.black38,
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            onPressed: (){
              //Navigator.pop(myContext);
              getMoviesByUser(myContext);
            },
            child: Text(
              "Agregar a mi catalogo",
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
        );
      }

      void getMoviesByUser( BuildContext context) async {
        CollectionReference collectionReference = FirebaseFirestore.instance
            .collection("moviesByUser");
        QuerySnapshot users = await collectionReference.get();
        List usuarios = [];
        if (users.docs.length != 0) {
          for (var doc in users.docs) {
            usuarios.add(doc.data());
          }
          for (var user in usuarios) {
            print(user['email']);
      //      if (user['email'] == emailUser) {
              print('entra');
              FirebaseFirestore.instance.collection("moviesByUser").add({
              'email': emailUser,
              'cover_url': imageMovie,
              'directed_by': directorMovie,
              'overview': sinopsisMovie,
              'release_date': dateMovie,
              'saga': genereMovie,
              'title': nameMovie
              });
              Navigator.pop(context);
              return;
      //      }

          }
        }
      }
    }
