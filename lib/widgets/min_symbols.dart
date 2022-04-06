import 'package:flutter/material.dart';

import '../resources/superheroes_colors.dart';

class MinSymbols extends StatelessWidget {
  const MinSymbols({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 110),
        child: Text(
          "Enter at least 3 symbols",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: SuperheroesColors.white,
          ),
        ),
      ),
    );
  }
}
