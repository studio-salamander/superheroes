import 'package:flutter/material.dart';
import 'package:superheroes/widgets/superhero_card.dart';

import '../pages/superhero_page.dart';
import '../resources/superheroes_colors.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 90),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Search results",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SuperheroCard(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SuperheroPage(name: "Batman"),
                ),
              );
            },
            name: "Batman",
            realName: "Bruce Wayne",
            imageUrl:
                "https://www.superherodb.com/pictures2/portraits/10/100/639.jpg",
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SuperheroCard(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SuperheroPage(name: "Venom"),
                ),
              );
            },
            name: "Venom",
            realName: "Eddie Brock",
            imageUrl:
                "https://www.superherodb.com/pictures2/portraits/10/100/22.jpg",
          ),
        )
      ],
    );
  }
}
