import 'package:equatable/equatable.dart';

import '../../data/model/character_model.dart';

abstract class CharactersCubitStates extends Equatable
{
  const CharactersCubitStates();

  @override
  List<Object> get props => [];
}

class CharactersInitialState extends CharactersCubitStates{}

class CharactersLoadingState extends CharactersCubitStates{}

class CharactersSuccessState extends CharactersCubitStates
{
  final List<Characters>allCharacters;
  const CharactersSuccessState(this.allCharacters);
}

class CharactersErrorState extends CharactersCubitStates
{
  final String errMessage;
  const CharactersErrorState(this.errMessage);
}