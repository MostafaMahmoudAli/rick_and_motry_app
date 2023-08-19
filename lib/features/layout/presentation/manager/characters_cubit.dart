import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repo/home_layout_characters_repo.dart';
import 'characters_cubit_states.dart';

class CharactersCubit extends Cubit<CharactersCubitStates>{
  final HomeLayoutCharactersRepo homeLayoutCharactersRepo;
  CharactersCubit(this.homeLayoutCharactersRepo) : super(CharactersInitialState());

  Future<void>fetchAllCharacters()async
  {
    var results = await homeLayoutCharactersRepo.getAllCharacters();

    results.fold(
            (failure)
        {
          emit(CharactersErrorState(failure.errMassage));
        } ,
            (allCharacters)
        {
          emit(CharactersSuccessState(allCharacters));
        }
    );
  }

}