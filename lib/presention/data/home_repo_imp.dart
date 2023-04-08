// import 'package:taskgithub/core/utils/serviesapi.dart';
// import 'package:taskgithub/presention/data/homeRepo.dart';
// import 'package:taskgithub/presention/data/model/repomodel.dart';
//
// class HomeRepoImpl implements HomeRepo
// {
//   DioHelper dio;
//   HomeRepoImpl(this.dio);
//   @override
//   Future<List<RepoModel>?> getRepo(int page) async{
//     var respons = await dio.getData(endpoint: "repos", query:
//     {
//       "per_page":"10",
//       "page":page
//     });
//     print(respons);
//     return respons.data;
//   }
//
//
//
// }