

import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/errors/failure.dart';

import '../model/character_model.dart';

abstract class HomeLayoutCharactersRepo
{
  Future<Either<Failure,List<Characters>>>getAllCharacters();
}