import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/upcoming_model/upcoming_model.dart';
import 'package:movies_app/repos/homeRepo.dart';
part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit(this.homeRepos) : super(UpcomingInitial());
  final HomeRepos homeRepos;
  Future<void> upcomingMovies() async {
    emit(UpcomingLoading());
    var data = await homeRepos.fetchUpcoming();
    data.fold(
      (failure) {
        emit(
          UpcomingFailure(
            failure.toString(),
          ),
        );
      },
      (movies) {
        emit(
          UpcomingSuccess(movies),
        );
      },
    );
  }
}
