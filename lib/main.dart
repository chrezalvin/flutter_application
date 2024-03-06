import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/CustomPage.dart';
import 'package:flutter_application/pages/FavouritesPage.dart';
import 'package:flutter_application/pages/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'Testing App',
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)
            ),
          home: MyHomePage(),
        )
      );
  }
}

class MyAppState extends ChangeNotifier {
  WordPair current = WordPair.random();

  List<WordPair> favourites = <WordPair>[];

  void toggleFavourite() {
    if (favourites.contains(current)) {
      favourites.remove(current);
    } else {
      favourites.add(current);
    }

    notifyListeners();
  }

  void changeWord() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    List<CustomPage> pageList = [
      CustomPage(
        icon: Icons.home,
        name: "Home Page",
        widget: HomePage(
          appState.current, 
          appState.favourites, 
          onClickFavorite: (wordPair) => {
            appState.toggleFavourite()
          },
          onClickNext: () => {
            appState.changeWord()
          },
        )
      ),
      CustomPage(
        icon: Icons.favorite,
        name: "Favorite",
        widget: FavoritesPage(appState.favourites)
      )
    ];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: pageList.map((page) => 
                    NavigationRailDestination(
                      icon: Icon(page.pageIcon), 
                      label: Text(page.pageName))
                    ).toList(),
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: pageList[selectedIndex].page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
