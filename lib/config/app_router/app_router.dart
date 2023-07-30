import 'package:go_router/go_router.dart';

import '../../features/layout/presentation/all_characters_screen.dart';


abstract class AppRouter
{
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AllCharactersScreen(),
      ),
    ],
  );
}