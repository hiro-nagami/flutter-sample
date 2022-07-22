import 'package:flutter/material.dart';

class GridText extends StatelessWidget {
  final String text;

  const GridText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
    var component = Text(text, style: style);
    return Padding(padding: const EdgeInsets.all(30.0), child: component);
  }
}

List<String> countries = [
  // "Iceland",
  // "America",
  // "Angola",
  // "India",
  // "UK",
  // "Ethiopia",
  // "Austraria",
  // "Canada",
  // "Greece",
  // "Colombia",
  // "Giorgia",
  // "Swizerland",
  // "France",
  // "Japan"
];

class CountryGrid extends StatelessWidget {
  const CountryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = countries.map(createListItem);

    return GridView.count(
      crossAxisCount: 2,
      children: cards.toList(),
    );
  }

  Widget createListItem(String title) {
    return Card(child: ListTile(title: Text(title)));
  }
}
