import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';

class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar(
      {Key? key, required this.name, required this.image, required this.id})
      : super(key: key);
  final String name;
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.6,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          name,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        background: Hero(
          tag: id,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
