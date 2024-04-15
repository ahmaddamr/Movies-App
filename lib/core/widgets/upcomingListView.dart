import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/widgets/upcoming_item.dart';
import 'package:movies_app/manager/cubit/upcoming_cubit.dart';

class UpcomingListView extends StatelessWidget {
  const UpcomingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingCubit, UpcomingState>(
      builder: (context, state) {
        if (state is UpcomingSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.upcoming.length,
              itemBuilder: (context, index) {
                print(state);
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push('/DetailsScreen', extra: state.upcoming[index]);
                    },
                    child: UpcomingItem(
                      
                      img: state.upcoming[index].posterPath!,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is UpcomingFailure) {
          print(state.error);
          return Text(state.error.toString());
        } else {
          print(state);
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
