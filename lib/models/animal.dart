class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });

  @override toString() => 'Name: $name';
}