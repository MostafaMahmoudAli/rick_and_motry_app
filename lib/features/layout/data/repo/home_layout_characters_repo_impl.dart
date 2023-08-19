import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rick_and_morty_app/core/errors/failure.dart';
import 'package:rick_and_morty_app/core/utils/api_service.dart';

import 'package:rick_and_morty_app/features/layout/data/model/character_model.dart';

import '../../../../core/utils/end_points.dart';
import 'home_layout_characters_repo.dart';

class HomeLayoutCharactersRepoImpl implements HomeLayoutCharactersRepo{
  ApiService apiService;
  HomeLayoutCharactersRepoImpl(this.apiService);
  @override
  Future<Either<Failure,List<CharactersModel>>>getAllCharacters() async
  {
    try
    {
      var data = await apiService.get(endPoint: EndPoints.allCharacters);

      List<CharactersModel>allCharacters =[];

      for(var item in data["results"])
      {
        allCharacters.add(CharactersModel.fromJson(item));
      }

      return right(allCharacters);

    }
    catch(e)
    {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()),);
    }
  }
}