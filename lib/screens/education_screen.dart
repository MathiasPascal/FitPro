class EducationScreen extends StatelessWidget {
  final List<String> tips = [
    "Hydrate properly after a workout.",
    "Use ice baths or foam rolling for recovery.",
    "Stretch daily to avoid injuries.",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tips.map((tip) => ListTile(title: Text(tip))).toList(),
    );
  }
}
