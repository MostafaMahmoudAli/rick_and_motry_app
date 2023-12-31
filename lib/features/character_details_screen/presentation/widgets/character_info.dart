import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({Key? key, required this.title, required this.value}) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text:title,
              style:Theme.of(context).textTheme.displayMedium,

            ),
            TextSpan(
              text:value,
              style:Theme.of(context).textTheme.titleMedium!.copyWith(
              ),

            ),
          ],
        ),
    );
  }
}
