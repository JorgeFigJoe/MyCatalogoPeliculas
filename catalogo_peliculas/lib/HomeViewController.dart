import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:catalogo_peliculas/SearchMovieViewController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DetailMovieViewController.dart';

class HomeViewController extends StatefulWidget{
  final String emailUser;
  HomeViewController({
    required this.emailUser
});
  @override
  _HomeViewController createState() => _HomeViewController(emailUser: emailUser);
}

class _HomeViewController extends State<HomeViewController> {
  final String emailUser;
  List? moviesList;

  _HomeViewController({
     required this.emailUser
  });

  void initState() {
    super.initState();
    if(mounted){
      fetchMoviesByUser(emailUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi catalogo: "+emailUser),
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
              buttonViewCatalogo(context),
              //buttonViewMyCatalogo(context, emailUser),
              moviesList != null ? Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
              2, childAspectRatio: 1.4,
              ), itemCount: moviesList?.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailMovieViewControllerState(nameMovie: moviesList![index]['title']?? "Sin datos", imageMovie: moviesList![index]['cover_url'], dateMovie: moviesList![index]['release_date']?? "Sin datos", directorMovie: moviesList![index]['directed_by']?? "Sin datos", genereMovie: moviesList![index]['saga']?? "Sin datos", sinopsisMovie: moviesList![index]['overview']?? "Sin datos")),
                      );
                    },
                    child: Card(
                        child: Column(
                          children: [
                            Text(
                                moviesList![index]['title']?? "Sin datos"
                            ),
                            CachedNetworkImage(imageUrl: moviesList![index]['cover_url'], height: 150,),
                          ],
                        )
                    ),
                  );
                },
              )) : Center(
                  child: CircularProgressIndicator()
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonViewCatalogo(BuildContext myContext){
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

  Widget buttonViewMyCatalogo(BuildContext myContext, String email){
    return FlatButton(
        color: Colors.black38,
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        onPressed: (){
          getMoviesByUser(email, myContext);
        },
        child: Text(
          "Ver mi catalogo",
          style: TextStyle(fontSize: 25, color: Colors.white),
        )
    );
  }

  void getMoviesByUser(String email, BuildContext context) async {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("moviesByUser");
    QuerySnapshot users = await collectionReference.get();
    if (users.docs.length != 0) {
      List movies = [];
      List moviesByUser = [];
      for (var doc in users.docs) {
        movies.add(doc.data());
      }
      for (var user in movies) {
        if(user['email'] == email){
          print(user['title']);
          moviesList?.add(user);
        }
      }
    }
  }

  void fetchMoviesByUser(String email) async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("moviesByUser");
    QuerySnapshot users = await collectionReference.get();
    if(users.docs.length != 0){
      List usuarios = [];
      List auxiliaryMovies = [];
      for(var doc in users.docs){
        usuarios.add(doc.data());
      }
      for(var user in usuarios){
        if(user['email'] == email){
          auxiliaryMovies.add(user);
          print('Si coincide');
        }
      }
      moviesList = auxiliaryMovies;
      print(moviesList);
    }
    setState(() {

    });
  }
}











