import 'package:dio/dio.dart';

abstract class Failure
{
  final String errMassage;
  const Failure(this.errMassage);
}

class ServerFailure extends Failure
{
  ServerFailure(super.errMassage);

  factory ServerFailure.fromDioError(DioException dioError)
  {
    switch(dioError.type)
    {

      case DioExceptionType.connectionTimeout:

        return ServerFailure("Connection timeout with ApiServer");

      case DioExceptionType.sendTimeout:
        return ServerFailure("SendTimeout timeout with ApiServer");
      case DioExceptionType.receiveTimeout:

        return ServerFailure("ReceiveTimeout timeout with ApiServer");

      case DioExceptionType.badCertificate:

        return ServerFailure("BadCertificate timeout with ApiServer");

      case DioExceptionType.badResponse:
       return ServerFailure.fromResponse(
         statusCode: dioError.response!.statusCode,
         response: dioError.response!.data
       );
      case DioExceptionType.cancel:

        return ServerFailure("request to ApiServer was canceled");

      case DioExceptionType.connectionError:

        return ServerFailure("An Connection Error");

      case DioExceptionType.unknown:
        return ServerFailure(" Oops unknown Error , please try again ");

     default:
       return ServerFailure("Oops there was an error , Please try again ! ");
    }
  }

  factory ServerFailure.fromResponse({required int? statusCode,required dynamic response})
  {
    if( statusCode == 400 || statusCode == 401 || statusCode == 403)
    {
      return ServerFailure(response["error"]);
    }else if (statusCode == 404)
    {
      return ServerFailure("Your request not found , Please try again later !");
    }else if (statusCode == 500)
    {
      return ServerFailure("Internet server error , Please try later !");
    }else if (statusCode == 501)
    {
      return ServerFailure("the server does not support the functionality required to fulfill the request");
    }else
    {
      return ServerFailure("Oops there was an error , Please try later!");
    }
  }
}