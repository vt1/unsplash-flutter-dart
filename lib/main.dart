import 'dart:convert';
import 'dart:async';
import 'photo.dart';
import 'photos_list.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final appTitle = 'Unsplash photos';

    return MaterialApp(
      title: appTitle,
      home: MainPage(title: appTitle),
    );
  }
}

class MainPage extends StatelessWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),        
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
            ? PhotosList(photos: snapshot.data)
            : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}