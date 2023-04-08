import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taskgithub/core/utils/serviesapi.dart';
import 'package:taskgithub/presention/data/homeRepo.dart';
import '../../presention/data/home_repo_imp.dart';

final getIt = GetIt.instance;

void setUp()
{
  // getIt.registerSingleton<HomeRepo>(HomeRepoImpl(DioHelper()));
}