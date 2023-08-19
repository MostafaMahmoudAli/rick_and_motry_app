import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/widgets/build_sliver_app_bar.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/widgets/character_details_bottom_section_screen.dart';
import 'package:rick_and_morty_app/features/layout/data/model/character_model.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        physics:const BouncingScrollPhysics(),
        slivers: [
          BuildSliverAppBar(
            name: character.name!,
            image: character.image!,
            id:character.id!,
          ),
          CharacterDetailsBottomSectionScreen(character:character),
        ],
      ),
    );
  }
}
