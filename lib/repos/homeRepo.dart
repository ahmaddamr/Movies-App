import 'package:dartz/dartz.dart';
import 'package:movies_app/models/top_rated_model/top_rated_model.dart';
import 'package:movies_app/models/tv_model/tv_model.dart';
import 'package:movies_app/models/upcoming_model/upcoming_model.dart';
import 'package:movies_app/repos/errors/failure.dart';

abstract class HomeRepos {
  Future<Either<Failure, List<UpcomingModel>>> fetchUpcoming();
  Future<Either<Failure, List<TopRatedModel>>> fetchTopRated();
  Future<Either<Failure, List<TvModel>>> fetchSeries();
}
