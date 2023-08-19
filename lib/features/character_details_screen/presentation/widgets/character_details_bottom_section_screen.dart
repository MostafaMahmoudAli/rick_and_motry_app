import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/componants.dart';
import '../../../layout/data/model/character_model.dart';
import 'character_info.dart';

class CharacterDetailsBottomSectionScreen extends StatelessWidget {
  const CharacterDetailsBottomSectionScreen({Key? key, required this.character}) : super(key: key);
  final CharactersModel character;
  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin:EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 0),
            padding:EdgeInsets.symmetric(
              horizontal:8.0.w,
              vertical:8.0.h,
            ),
            child:Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                CharacterInfo(
                  title:"status :",
                  value:character.status!,
                ),
                MyDivider(
                  endIndent:MediaQuery.sizeOf(context).width * 0.7,
                ),
                CharacterInfo(
                  title:"species :",
                  value:character.species!,
                ),
                MyDivider(
                  endIndent:MediaQuery.sizeOf(context).width * 0.66,
                ),
                CharacterInfo(
                  title:"gender :",
                  value:character.gender!,
                ),
                MyDivider(
                  endIndent:MediaQuery.sizeOf(context).width * 0.67,
                ),
                if(character.type!.isNotEmpty)
                CharacterInfo(
                  title:"type :",
                  value:character.type!,
                ),
                if(character.type!.isNotEmpty)
                MyDivider(
                  endIndent:MediaQuery.sizeOf(context).width * 0.73,
                ),
                CharacterInfo(
                  title:"origin :",
                  value:character.origin!.name!,
                ),
                MyDivider(
                  endIndent:MediaQuery.sizeOf(context).width * 0.71,
                ),
                CharacterInfo(
                  title:"location :",
                  value:character.location!.name!,
                ),
                MyDivider(
                  endIndent:MediaQuery.sizeOf(context).width * 0.66,
                ),
                SizedBox(
                  height:500.0.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
