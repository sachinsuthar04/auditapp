class FilterModel {
  String status;
  bool selected;

  FilterModel({
    required this.status,
    required this.selected,
  });
}

class User {
  final String name;
  final int id;

  User({required this.name, required this.id});

  @override
  String toString() {
    return 'User(name: $name, id: $id)';
  }
}
