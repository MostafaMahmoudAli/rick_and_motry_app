import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';

ThemeData themeData()
{
  return ThemeData(
    appBarTheme:const AppBarTheme(
      backgroundColor:AppColors.yellow,
    ),
    textTheme:TextTheme(
      displayLarge:TextStyle(
        color:AppColors.grey,
        fontSize:30.sp,
        fontWeight:FontWeight.bold,
      ),
      displayMedium:TextStyle(
        color:AppColors.white,
        fontSize:18.sp,
        fontWeight:FontWeight.w700,
      ),
      displaySmall:TextStyle(
        color:AppColors.grey,
        fontSize:18.sp,
        fontWeight:FontWeight.bold,
      ),
      titleMedium:TextStyle(
        color:AppColors.white.withOpacity(0.75),
        fontSize:18.sp,
        fontWeight:FontWeight.bold,
      ) ,
      titleSmall:TextStyle(
        color:AppColors.white,
        fontSize:12.sp,
        fontWeight:FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: AppColors.grey,
  );
}