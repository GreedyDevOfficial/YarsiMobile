class Favorite {
  final int id;
  final String name;

  Favorite({
    required this.id,
    required this.name,
  });

  @override toString() => 'Name: $name';
}