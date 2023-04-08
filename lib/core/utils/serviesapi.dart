import 'package:dio/dio.dart';
import 'package:taskgithub/presention/data/model/repomodel.dart';

class DioHelper {
   static Dio? dio;
  static const baseurl = "https://api.github.com/users/square/";

 static init() {
    dio = Dio(
        BaseOptions(
            baseUrl: baseurl,
            receiveDataWhenStatusError: true,
          headers:{
              "Authorization":"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"
          }
        )
    );
  }
 static  Future<Response> getData(
   {
    required String endpoint,
    required Map<String,dynamic> query
}
      )async
  {
   return   await dio!.get(endpoint,queryParameters: query);
  }

}
