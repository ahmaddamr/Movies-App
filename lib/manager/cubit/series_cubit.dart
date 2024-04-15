import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/models/tv_model/tv_model.dart';
import 'package:movies_app/repos/homeRepo.dart';

part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  SeriesCubit(this.homeRepos) : super(SeriesInitial());
  final HomeRepos homeRepos;
  Future<void> seriesCubit() async {
    emit(SeriesLoading());
    var data = await homeRepos.fetchSeries();
    data.fold((failure) {
      print(failure);
      emit(
        SeriesFailure(failure.error),
      );
    }, (series) {
      emit(
        SeriesSuccess(series),
      );
    });
  }
}
