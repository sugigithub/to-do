class Category {
  final String name;

  const Category._(this.name);

  static const Category work = Category._('work');
  static const Category travel = Category._('travel');
  static const Category dailyRoutine = Category._('daily routine');

  static List<Category> values = [
    work,
    travel,
    dailyRoutine,
  ];

  static void addCategory(String name) {
    values.add(Category._(name));
  }
}
