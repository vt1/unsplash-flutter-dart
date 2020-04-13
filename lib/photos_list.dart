import 'photo.dart';
import 'full_screen_photo.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,      
      itemBuilder: (context, index) {        
        return Stack(      
          children: [
            GFAvatar(
              backgroundImage: CachedNetworkImageProvider(photos[index].smallUrl),
              shape: GFAvatarShape.square,
              radius: 200.0,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black45),              
              child: Text(
                photos[index].author ?? 'no author',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),            
              )              
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FullScreenPhoto(photo: photos[index]);
                }));
              },
            )
          ],          
        );
      },
    );
  }
}