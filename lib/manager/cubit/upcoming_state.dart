part of 'upcoming_cubit.dart';

@immutable
sealed class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoading extends UpcomingState {}

final class UpcomingSuccess extends UpcomingState {
  final List<UpcomingModel> upcoming;

  UpcomingSuccess(this.upcoming);
}

final class UpcomingFailure extends UpcomingState {
  final String error;

  UpcomingFailure(this.error);
}
