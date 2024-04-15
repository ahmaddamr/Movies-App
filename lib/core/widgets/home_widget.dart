import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/core/constans.dart';
import 'package:movies_app/core/widgets/seriesListView.dart';
import 'package:movies_app/core/widgets/topRatedListView.dart';
import 'package:movies_app/core/widgets/upcomingListView.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Movies',
              style: Apptheme.appBarTextLarge,
            ),
          ),
          const UpcomingListView(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Top Rated Movies',
              style: Apptheme.appBarTextLarge,
            ),
          ),
          const TopRatedListView(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Newest Tv',
              style: Apptheme.appBarTextLarge,
            ),
          ),
          const SeriesListView()
        ],
      ),
    );
  }
}
