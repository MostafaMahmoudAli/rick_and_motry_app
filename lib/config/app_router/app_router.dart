import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/character_details_screen.dart';
import 'package:rick_and_morty_app/features/layout/presentation/manager/characters_cubit.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/service_locator.dart';
import '../../features/layout/data/model/character_model.dart';
import '../../features/layout/data/repo/home_layout_characters_repo_impl.dart';
import '../../features/layout/presentation/all_characters_screen.dart';

// abstract class AppRouter
// {
//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const AllCharactersScreen(),
//       ),
//       GoRoute(
//         path:characterDetailsScreenPath,
//         builder:(context,state)=> CharactersDetailsScreen(
//             character: state.extra as CharactersModel,
//         ),
//       ),
//     ],
//   );
// }

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => const AllCharactersScreen());

      case characterDetailsScreenPath:
        final character = settings.arguments as CharactersModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              return CharactersCubit(getIt.get<HomeLayoutCharactersRepoImpl>());
            },
            child: CharactersDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
