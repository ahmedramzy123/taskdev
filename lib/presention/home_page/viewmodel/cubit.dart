import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskgithub/core/utils/serviesapi.dart';
import 'package:taskgithub/presention/data/homeRepo.dart';
import 'package:taskgithub/presention/data/model/repomodel.dart';
import 'package:taskgithub/presention/home_page/viewmodel/state.dart';

class CubitApp extends Cubit<StateApp>
{
  CubitApp():super (Init());
   static CubitApp get(context) => BlocProvider.of(context);
   HomeRepo? repo;
   List<RepoModel> model=[];
   void getRepo()
   {
   DioHelper.getData(endpoint: "repos", query:
   {
     "per_page":"10",
     "page":page
   }).then((value)
   {
     List<dynamic> data = value.data ;
     model.addAll(data.map((e) => RepoModel.fromJson(e)).toList());
     // print(model![1].repoName);
     emit(GetRepoSuccess());
   });
   }
   int page = 1;
  void loadNextPage(BuildContext context){
      page++;
      CubitApp.get(context).getRepo() ;

  }

}