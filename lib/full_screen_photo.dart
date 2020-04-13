import 'photo.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FullScreenPhoto extends StatelessWidget {
  final Photo photo;

  FullScreenPhoto({Key key, @required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Material(
      child: InkWell(
        onTap: () {
        Navigator.pop(context);
      },
      child: CachedNetworkImage(
        imageUrl: photo.smallUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover
            )
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
      )
      )
    );    
  }
}