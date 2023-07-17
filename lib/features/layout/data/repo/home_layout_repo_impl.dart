import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rick_and_morty_app/core/errors/failure.dart';
import 'package:rick_and_morty_app/core/utils/api_service.dart';

import 'package:rick_and_morty_app/features/layout/data/model/character_model.dart';

import '../../../../core/utils/end_points.dart';
import 'home_layout_repo.dart';

class HomeLayoutRepoImpl implements HomeLayoutRepo{
  ApiService apiService;
  HomeLayoutRepoImpl(this.apiService);
  @override
  Future<Either<Failure,List<CharacterModel>>> getAllCharacters() async
  {
    try
    {
      var data = await apiService.get(endPoint: EndPoints.allCharacters);

      List<CharacterModel>characterModel =[];

      characterModel.add(CharacterModel.fromJson(data));

      return right(characterModel);

    }catch(e)
    {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()),);
    }
  }
}