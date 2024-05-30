
import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingModel {
  final String img;
  final String text;
  final String desc;
  final Color bg;
  final Color button;

  OnBoardingModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}
final screens = [
  OnBoardingModel(
    img: ImageManager.photo1,
    text: "Boost Productivity",
    desc: "Elevate your productivity to new heights and grow with us",
    bg: ColorsManager.mainWhite,
    button: const Color(0xff4756DF),
  ),
  OnBoardingModel(
    img: ImageManager.photo2,
    text: "Work Seamlessly",
    desc: "Get your work done seamlessly without interruption",
    bg: ColorsManager.mainWhite,
    button: const Color(0xff4756DF),
  ),
  OnBoardingModel(
    img: ImageManager.photo3,
    text: "Achieve Higher Goals",
    desc: "By boosting your productivity we help you achieve higher goals",
    bg: ColorsManager.mainWhite,
    button: const Color(0xff4756DF),
  ),
];
