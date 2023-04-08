import 'package:taskgithub/presention/data/model/repomodel.dart';

abstract class HomeRepo
{
  Future<List<RepoModel>?> getRepo (int page);
}