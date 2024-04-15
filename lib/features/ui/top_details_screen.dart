import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/core/constans.dart';
import 'package:movies_app/models/top_rated_model/top_rated_model.dart';

class TopDetailsScreen extends StatelessWidget {
  const TopDetailsScreen({
    super.key,
    required this.topRatedModel,
  });
  final TopRatedModel topRatedModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${topRatedModel.backdropPath}',
              fit: BoxFit.fill,
              width: double.infinity,
              height: 280,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${topRatedModel.posterPath}',
                        fit: BoxFit.fill,
                        width: 180,
                        height: 225,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 25),
                    child: Text(
                      topRatedModel.title ?? "",
                      style: Apptheme.appBarTextLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 25),
                    child: Text(
                      topRatedModel.overview ?? "",
                      style: Apptheme.appBarTextSmall,
                      textAlign: TextAlign.start,
                      // overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 25),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 228, 172, 3),
                          size: 27,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          topRatedModel.voteAverage.toString(),
                          style: Apptheme.appBarTextSmall
                              .copyWith(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 25),
                    child: Text(
                      'Language: ${topRatedModel.originalLanguage}',
                      style: Apptheme.appBarTextLarge,
                      textAlign: TextAlign.start,
                      // overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
