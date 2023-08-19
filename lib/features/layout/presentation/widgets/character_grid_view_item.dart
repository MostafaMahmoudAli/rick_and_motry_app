import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/data_images.dart';
import '../../data/model/character_model.dart';

class CharacterGridViewItem extends StatelessWidget {
  const CharacterGridViewItem({Key? key, required this.character})
      : super(key: key);
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
      padding: EdgeInsets.symmetric(
        vertical: 4.0.h,
        horizontal: 4.0.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:BorderRadius.circular(10.0.r),
      ),
      child: GestureDetector(
        onTap:()
        {
          Navigator.pushNamed(context, characterDetailsScreenPath ,arguments: character);
        },
        child: GridTile(
          footer:GridTileBar(
            backgroundColor:AppColors.black,
            title:Text(
              character.name!,
              style:Theme.of(context).textTheme.displayMedium,
              maxLines:2,
              overflow:TextOverflow.ellipsis,
              textAlign:TextAlign.center,
            ),
          ),
          child: Hero(
            tag: character.id!,
            child: Container(
              color: AppColors.grey,
              child: character.image!.isEmpty
                  ? Image.asset(DataImages.placeHolderImage)
                  : FadeInImage.assetNetwork(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      placeholder: DataImages.loadingImage,
                      image: character.image!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
