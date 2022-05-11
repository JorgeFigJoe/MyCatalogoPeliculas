import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'SearchMovieViewController.dart';

  class DetailMovieViewControllerState extends StatelessWidget{

      final String nameMovie;
      final String imageMovie;
      final String dateMovie;
      final String directorMovie;
      final String genereMovie;
      final String sinopsisMovie;

      DetailMovieViewControllerState({
        required this.nameMovie,
        required this.imageMovie,
        required this.dateMovie,
        required this.directorMovie,
        required this.genereMovie,
        required this.sinopsisMovie
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
    }
