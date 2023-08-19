import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';

import '../data/model/character_model.dart';

class CharactersSearch extends StatefulWidget {
   const CharactersSearch({Key? key, this.characters, }) : super(key: key);
   final List<CharactersModel>?characters;
  @override
  State<CharactersSearch> createState() => _CharactersSearchState(this.characters);
}

class _CharactersSearchState extends State<CharactersSearch> {
  _CharactersSearchState(this.characters);
  List<CharactersModel>?characters;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  List<CharactersModel>?searchedForCharacter;

  @override
  Widget build(BuildContext context)
  {
    return TextField(
      controller:searchController,
      cursorColor: AppColors.grey,
      decoration:InputDecoration(
        hintText:"Find A Character",
        hintStyle:Theme.of(context).textTheme.displaySmall,
        border:InputBorder.none
      ),
      style:Theme.of(context).textTheme.displaySmall,
      onChanged:(searchedCharacter)
      {
        addSearchedItemToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedItemToSearchedList(String searchedCharacter)
  {
    searchedForCharacter = characters!.where((element)
    {
      return element.name!.toLowerCase().startsWith(searchedCharacter);
    }).toList();
    setState(() {

    });
  }
}
