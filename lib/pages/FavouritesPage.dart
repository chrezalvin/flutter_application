import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<WordPair> favorites;

  FavoritesPage(this.favorites);

  @override
  Widget build(BuildContext context) {

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorites.length} favorites:'),
        ),
        for (var pair in favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}