import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'character_grid_view_item.dart';

class AllCharactersBodyView extends StatelessWidget {
  const AllCharactersBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
      childAspectRatio:2/3,
      crossAxisSpacing:1.0.w,
      mainAxisSpacing: 1.0.w,

    ),
        itemBuilder: (context,index)=>const CharacterGridViewItem(),
    );
  }
}
