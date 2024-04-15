import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/models/top_rated_model/top_rated_model.dart';
import 'package:movies_app/repos/homeRepo.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.homeRepos) : super(TopRatedInitial());
  final HomeRepos homeRepos;
  Future<void> TopRatedMovies() async {
    emit(TopRatedLoading());
    var data = await homeRepos.fetchTopRated();
    data.fold((failure) {
      print(failure);
      emit(
        TopRatedFailure(failure.error),
      );
    }, (movies) {
      emit(
        TopRatedSuccess(movies),
      );
    });
  }
}
