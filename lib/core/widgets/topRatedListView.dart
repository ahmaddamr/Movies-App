import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/widgets/top_rated_item.dart';
import 'package:movies_app/manager/cubit/top_rated_cubit.dart';

class TopRatedListView extends StatelessWidget {
  const TopRatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedSuccess) {
          print(state);
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.43,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.top.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push('/TopDetailsScreen', extra: state.top[index]);
                    },
                    child: TopRatedMoviesItem(
                      img: state.top[index].posterPath ?? "",
                      title: state.top[index].title ?? "",
                      kind: state.top[index].originalLanguage ?? '',
                      Rate: state.top[index].voteAverage ?? "",
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is TopRatedFailure) {
          print(state.errormsg.toString());
          return Text(state.errormsg.toString());
        } else {
          print(state);
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
