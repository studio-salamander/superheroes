import 'package:flutter/material.dart';

import '../resources/superheroes_colors.dart';

class SuperheroCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String name;
  final String realName;
  final String imageUrl;

  const SuperheroCard({
    Key? key,
    required this.onTap,
    required this.name,
    required this.realName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: SuperheroesColors.darkGray,
        height: 70,
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: SuperheroesColors.white,
                    ),
                  ),
                  Text(
                    realName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: SuperheroesColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
