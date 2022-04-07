import 'package:flutter/material.dart';

import '../resources/superheroes_colors.dart';
import '../resources/superheroes_images.dart';
import 'action_button.dart';

class InfoWithButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String assetImage;
  final double imageHeight;
  final double imageWidth;
  final double imageTopPadding;

  const InfoWithButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.assetImage,
    required this.imageHeight,
    required this.imageWidth,
    required this.imageTopPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: SuperheroesColors.blue,
              ),
              height: 108,
              width: 108,
            ),
            Padding(
              padding: EdgeInsets.only(top: imageTopPadding),
              child: Image.asset(
                assetImage,
                width: imageWidth,
                height: imageHeight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          subtitle.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        ActionButton(
          onTap: () {},
          text: buttonText,
        ),
      ],
    );
  }
}
