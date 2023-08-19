import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/layout/presentation/manager/characters_cubit.dart';
import 'package:rick_and_morty_app/features/layout/presentation/manager/characters_cubit_states.dart';
import '../../../../core/utils/componants.dart';
import '../../data/model/character_model.dart';
import 'character_grid_view_item.dart';

class AllCharactersBodyView extends StatelessWidget {
  const AllCharactersBodyView({Key? key, required this.searchingController, this.searchedForCharacter}) : super(key: key);
  final TextEditingController searchingController;
  final List<CharactersModel>? searchedForCharacter;
  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<CharactersCubit,CharactersCubitStates>(
      builder:(context,state)
      {
         if (state is CharactersSuccessState)
        {
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio:2/3,
            crossAxisSpacing:1.0.w,
            mainAxisSpacing: 1.0.w,
          ),
            itemBuilder: (context,index)=> CharacterGridViewItem(character:searchingController.text.isNotEmpty? searchedForCharacter![index]: state.allCharacters[index]),
            itemCount:searchingController.text.isNotEmpty? searchedForCharacter!.length :state.allCharacters.length,
            shrinkWrap:true,
            physics:const ClampingScrollPhysics(),
            padding:EdgeInsets.zero,
          );
        }else if(state is CharactersErrorState)
        {
          return CustomErrorMessage(errMessage: state.errMessage,);
        }else
        {
          return const CircularProgressIndicator(color: AppColors.yellow,);
        }
      },
    );
  }
}
