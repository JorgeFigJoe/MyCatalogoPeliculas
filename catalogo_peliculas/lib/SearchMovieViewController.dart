import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class SearchViewController extends StatefulWidget{
  @override
  _SearchViewControllerState createState() => _SearchViewControllerState();
}

class _SearchViewControllerState extends State<SearchViewController> {
  var moviesApi = "https://mcuapi.herokuapp.com/api/v1/movies";
  List? moviesList;

  @override
  @override
  void initState() {
    super.initState();
    if(mounted){
      fetchMoviesData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
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
              moviesList != null ? Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
              2, childAspectRatio: 1.4,
              ), itemCount: moviesList?.length,
                itemBuilder: (context, index){
                  return Card(
                      child: Column(
                        children: [
                          Text(
                              moviesList![index]['title']?? "Sin datos"
                          ),
                          CachedNetworkImage(imageUrl: moviesList![index]['cover_url'])
                        ],
                      )
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

  void fetchMoviesData(){
    var url = Uri.https("mcuapi.herokuapp.com", "/api/v1/movies");
    http.get(url).then((value){
      var decodeJson = jsonDecode(value.body);
      moviesList = decodeJson['data'];
      print(moviesList);

      setState(() {

      });

    });
  }
}

