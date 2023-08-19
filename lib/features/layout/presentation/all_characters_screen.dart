import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/core/utils/service_locator.dart';
import 'package:rick_and_morty_app/features/layout/data/repo/home_layout_characters_repo_impl.dart';
import 'package:rick_and_morty_app/features/layout/presentation/manager/characters_cubit.dart';
import 'package:rick_and_morty_app/features/layout/presentation/manager/characters_cubit_states.dart';
import 'package:rick_and_morty_app/features/layout/presentation/widgets/all_characters_body_view.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constants.dart';
import '../data/model/character_model.dart';

class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({Key? key}) : super(key: key);

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  List<CharactersModel>? characters;

  TextEditingController searchController = TextEditingController();

  bool isSearching = false;

  List<CharactersModel>? searchedForCharacter;

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) =>
          CharactersCubit(getIt.get<HomeLayoutCharactersRepoImpl>())
            ..fetchAllCharacters(),
      child: BlocBuilder<CharactersCubit, CharactersCubitStates>(
        builder: (context, state) {
          if (state is CharactersSuccessState) {
            characters = state.allCharacters;
            return Scaffold(
              appBar: AppBar(
                leading: isSearching
                    ? const BackButton(
                        color: AppColors.grey,
                      )
                    : const SizedBox(),
                title: isSearching
                    ? TextField(
                        controller: searchController,
                        cursorColor: AppColors.grey,
                        decoration: InputDecoration(
                            hintText: "Find A Character",
                            hintStyle: Theme.of(context).textTheme.displaySmall,
                            border: InputBorder.none),
                        style: Theme.of(context).textTheme.displaySmall,
                        onChanged: (searchedCharacter) {
                          addSearchingItemToSearchingList(searchedCharacter);
                        },
                      )
                    : Text(
                        appBarTitle,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                actions: isSearching == true
                    ? [
                        IconButton(
                          onPressed: () {
                            clearSearch();
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: AppColors.grey,
                          ),
                        ),
                      ]
                    : [
                        IconButton(
                          onPressed: startSearching,
                          icon: const Icon(
                            Icons.search_outlined,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
              ),
              body:  SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AllCharactersBodyView(
                      searchingController:searchController,
                      searchedForCharacter:searchedForCharacter,
                    ),
                  ],
                ),
              ),
            );
          }
          return AppBar();
        },
      ),
    );
  }

  void addSearchingItemToSearchingList(String searchedCharacter) {
    searchedForCharacter = characters!.where((element)
    {
      return element.name!.toLowerCase().startsWith(searchedCharacter);
    }).toList();
    setState((){});
  }

  void startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
    });
  }
}
