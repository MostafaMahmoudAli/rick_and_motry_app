
import 'package:dio/dio.dart';

class ApiService{
  final _baseUrl ="https://rickandmortyapi.com/api/";
  late final Dio dio;
  ApiService(this.dio)
  {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError:true,
      connectTimeout: const Duration(
        seconds: 30,
      ),
      receiveTimeout:const Duration(
        seconds: 30,
      ),
    );
    dio =Dio(options);
  }

  Future<Map<String,dynamic>>get({required String? endPoint})async
  {
    var response = await dio.get("$endPoint");
    return response.data;
  }
}