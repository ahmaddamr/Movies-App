import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UpcomingItem extends StatelessWidget {
  const UpcomingItem({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 140,
        width: 240,
        child:CachedNetworkImage(
        imageUrl: 'https://image.tmdb.org/t/p/w500$img',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.fill,
      ),
        //  Image.network(
        //   'https://image.tmdb.org/t/p/w500${img}',
        //   fit: BoxFit.fill,
        // ),
      ),
    );
  }
}
