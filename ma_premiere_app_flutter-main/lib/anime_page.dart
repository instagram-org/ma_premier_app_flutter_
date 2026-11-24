import 'package:flutter/material.dart';
class AnimePage extends StatefulWidget {
final String titre;
final int total;
const AnimePage({
super.key,
required this.titre,
required this.total,
});


  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
@override
int vus = 0;

Widget build(BuildContext context) {

return Scaffold(
appBar: AppBar(
title: const Text('Anime'),
),
body: Padding(
padding: const EdgeInsets.all(24),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(widget.titre,
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
const Text(
'Épisodes vus',
style: TextStyle(color: Colors.grey),
),
const SizedBox(height: 16),
Text(
'$vus / $widget.total',
style: Theme.of(context).textTheme.displayMedium,
),
const SizedBox(height: 24),
LinearProgressIndicator(value: vus / widget.total),
const SizedBox(height: 32),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
      ),
      onPressed: () {
        if (vus > 0) {
          setState(() {
            vus--;
          });
        }
      },
      child: const Text('-1'),
    ),
    ElevatedButton(
      onPressed: () {
        setState(() {
          vus = 0;
        });
      },
      child: const Text('Zéro'),
    ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen,
      ),
      onPressed: () {
        if (vus < widget.total) {
          setState(() {
            vus++;
          });
        }
      },
      child: const Text('+1'),
    ),
  ],
),
],
),
),

);
}
}