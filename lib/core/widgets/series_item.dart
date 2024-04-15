import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constans.dart';

class SeriesItem extends StatelessWidget {
  const SeriesItem(
      {super.key,
      required this.img,
      required this.title,
      required this.lan,
      this.rate});
  final String img;
  final String title;
  final String lan;
  final dynamic rate;

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
              'https://image.tmdb.org/t/p/w500${img}',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 200,
            // height: 100,
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
                    lan,
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
                        rate.toString(),
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
