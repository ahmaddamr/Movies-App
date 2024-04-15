import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/widgets/series_item.dart';
import 'package:movies_app/manager/cubit/series_cubit.dart';

class SeriesListView extends StatelessWidget {
  const SeriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesCubit, SeriesState>(
      builder: (context, state) {
        if (state is SeriesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.43,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.serieses.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push('/SeriesDetailsScreen',
                          extra: state.serieses[index]);
                    },
                    child: SeriesItem(
                      img: state.serieses[index].posterPath ?? "",
                      title: state.serieses[index].name ?? "",
                      lan: state.serieses[index].originalLanguage ?? "",
                      rate: state.serieses[index].voteAverage ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SeriesFailure) {
          return Text(
            state.errormsg.toString(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
