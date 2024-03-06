import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/BigCard.dart';

class HomePage extends StatelessWidget {
  final WordPair wordPair;
  final List<WordPair> listWordPair;
  final void Function(WordPair)? onClickFavorite;
  final void Function()? onClickNext;

  HomePage(
    this.wordPair, 
    this.listWordPair,
    // optional params
    {
    this.onClickFavorite,
    this.onClickNext
    });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (listWordPair.contains(wordPair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: wordPair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  onClickFavorite?.call(wordPair);
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  onClickNext?.call();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}