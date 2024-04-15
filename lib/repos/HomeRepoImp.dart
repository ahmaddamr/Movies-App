import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/models/top_rated_model/top_rated_model.dart';
import 'package:movies_app/models/tv_model/tv_model.dart';
import 'package:movies_app/models/upcoming_model/upcoming_model.dart';
import 'package:movies_app/repos/errors/failure.dart';
import 'package:movies_app/repos/homeRepo.dart';
import 'package:movies_app/services/api_service.dart';

class HomeReposImp implements HomeRepos {
  final ApiService apiService;
  HomeReposImp(this.apiService);

  @override
  Future<Either<Failure, List<UpcomingModel>>> fetchUpcoming() async {
    try {
      var data = await apiService.getRequest(
          url: '/movie/upcoming?api_key=c572b49d36a8da95c0add6e65b92ce1c');
      List<UpcomingModel> movies = [];
      for (var element in data["results"]) {
        movies.add(
          UpcomingModel.fromJson(element),
        );
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          FailureBody(
            e.message.toString(),
          ),
        );
      }
      print(e.toString());

      return left(
        FailureBody(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TopRatedModel>>> fetchTopRated() async {
    try {
      var data = await apiService.getRequest(
          url: '/movie/top_rated?api_key=c572b49d36a8da95c0add6e65b92ce1c');
      List<TopRatedModel> movies = [];
      for (var element in data['results']) {
        movies.add(
          TopRatedModel.fromJson(element),
        );
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          FailureBody(
            e.message.toString(),
          ),
        );
      }
      print(
        e.toString(),
      );

      return left(
        FailureBody(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> fetchSeries() async {
    try {
      var data = await apiService.getRequest(
          url: '/discover/tv?api_key=c572b49d36a8da95c0add6e65b92ce1c');
      List<TvModel> series = [];
      for (var element in data['results']) {
        series.add(
          TvModel.fromJson(element),
        );
      }
      return right(series);
    } catch (e) {
      if (e is DioException) {
        return left(
          FailureBody(
            e.message.toString(),
          ),
        );
      }
      print(
        e.toString(),
      );

      return left(
        FailureBody(
          e.toString(),
        ),
      );
    }
  }
}
