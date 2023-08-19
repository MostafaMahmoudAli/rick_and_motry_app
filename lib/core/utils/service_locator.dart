
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/utils/api_service.dart';
import 'package:rick_and_morty_app/features/layout/data/repo/home_layout_characters_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator()
{
  getIt.registerLazySingleton<ApiService>(
        () => ApiService(
      Dio(),
  ),
  );
  getIt.registerLazySingleton<HomeLayoutCharactersRepoImpl>(
        ()=> HomeLayoutCharactersRepoImpl(getIt.get<ApiService>()),
  );
}