import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/core/constans.dart';

class TopRatedMoviesItem extends StatelessWidget {
  const TopRatedMoviesItem(
      {super.key,
      required this.title,
      required this.kind,
      required this.Rate,
      required this.img});
  final String title;
  final String kind;
  final String img;
  final dynamic Rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff21242E),
      // shape:   Radius.circular(radius),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.25,
            width: 200,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500$img',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 200,
            // height: MediaQuery.of(context).size.height *0.5,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Apptheme.appBarTextLarge.copyWith(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    kind,
                    style:
                        Apptheme.appBarTextSmall.copyWith(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 228, 172, 3),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        Rate.toString(),
                        style: Apptheme.appBarTextSmall
                            .copyWith(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
