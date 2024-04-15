part of 'series_cubit.dart';

sealed class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

final class SeriesInitial extends SeriesState {}

final class SeriesLoading extends SeriesState {}

final class SeriesSuccess extends SeriesState {
  final List<TvModel> serieses;

  const SeriesSuccess(this.serieses);
}

final class SeriesFailure extends SeriesState {
  final String errormsg;

  const SeriesFailure(this.errormsg);
}
