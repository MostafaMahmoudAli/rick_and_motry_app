import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/utils/service_locator.dart';
import 'package:rick_and_morty_app/features/layout/data/repo/home_layout_characters_repo_impl.dart';
import 'package:rick_and_morty_app/features/layout/presentation/manager/characters_cubit.dart';
import 'package:rick_and_morty_app/features/layout/presentation/widgets/all_characters_body_view.dart';

import '../../../core/utils/constants.dart';

class AllCharactersScreen extends StatelessWidget {
  const AllCharactersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          appBarTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body:BlocProvider(
        create:(context)=>CharactersCubit(getIt.get<HomeLayoutCharactersRepoImpl>()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AllCharactersBodyView(),
            ],
          ),
        ),
      ),
    );
  }
}
