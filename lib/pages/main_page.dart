import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/blocs/main_bloc.dart';
import 'package:superheroes/resources/superheroes_colors.dart';
import 'package:superheroes/resources/superheroes_images.dart';
import 'package:superheroes/widgets/action_button.dart';

import '../widgets/favorites.dart';
import '../widgets/info_with_button.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/min_symbols.dart';
import '../widgets/search_result.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class MainBlocHolder extends InheritedWidget {
  final MainBloc bloc;

  const MainBlocHolder({
    Key? key,
    required this.bloc,
    required final Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MainBlocHolder oldWidget) => false;

  static MainBlocHolder of(final BuildContext context) {
    final InheritedElement element =
        context.getElementForInheritedWidgetOfExactType<MainBlocHolder>()!;
    return element.widget as MainBlocHolder;
  }
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: bloc,
      child: const Scaffold(
        backgroundColor: SuperheroesColors.background,
        body: SafeArea(
          child: MainPageContent(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = Provider.of<MainBloc>(context);
    return Stack(
      children: [
        const MainPageStateWidget(),
        Align(
          alignment: Alignment.bottomCenter,
          child: ActionButton(
            onTap: () => bloc.nextState(),
            text: "Next State",
          ),
        ),
      ],
    );
  }
}

class MainPageStateWidget extends StatelessWidget {
  const MainPageStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = Provider.of<MainBloc>(context);
    return StreamBuilder<MainPageState>(
      stream: bloc.observeMainPageState(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox();
        }
        final MainPageState state = snapshot.data!;
        switch (state) {
          case MainPageState.noFavorites:
            return const InfoWithButton(
              title: "No favorites yet",
              subtitle: "Search and add",
              buttonText: "Search",
              assetImage: SuperheroesImages.ironman,
              imageHeight: 119,
              imageWidth: 108,
              imageTopPadding: 9,
            );
          case MainPageState.minSymbols:
            return const MinSymbols();
          case MainPageState.loading:
            return const LoadingIndicator();
          case MainPageState.favorites:
            return const Favorites();
          case MainPageState.nothingFound:
            return const InfoWithButton(
              title: "Nothing found",
              subtitle: "Search for something else",
              buttonText: "Search",
              assetImage: SuperheroesImages.hulk,
              imageHeight: 112,
              imageWidth: 112,
              imageTopPadding: 16,
            );
          case MainPageState.loadingError:
            return const InfoWithButton(
              title: "Error happened",
              subtitle: "Error happened",
              buttonText: "Retry",
              assetImage: SuperheroesImages.superman,
              imageHeight: 106,
              imageWidth: 126,
              imageTopPadding: 22,
            );
          case MainPageState.searchResults:
            return const SearchResult();
          default:
            return Center(
              child: Text(
                snapshot.data!.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
        }
      },
    );
  }
}
