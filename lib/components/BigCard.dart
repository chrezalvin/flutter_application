import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  Color getRandomColor() {
    const List<Color> colors = [
      Colors.grey,
      Colors.amber,
      Colors.blue,
      Colors.yellowAccent,
    ];

    Color color = colors[Random().nextInt(colors.length)];

    return color;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
        ),
      ),
    );
  }
}