part of 'top_rated_cubit.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {
  final List<TopRatedModel> top;

  const TopRatedSuccess(this.top);
}

final class TopRatedFailure extends TopRatedState {
  final String errormsg;

  const TopRatedFailure(this.errormsg);
}
