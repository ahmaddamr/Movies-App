import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final Dio dio = Dio();
  Future<Map<String, dynamic>> getRequest({required String url}) async {
    var response = await dio.get('$baseUrl$url');
    print(response.data);
    return response.data;
  }
}
