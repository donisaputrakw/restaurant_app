class DrinksModel {
  final String name;

  DrinksModel({
    required this.name,
  });

  factory DrinksModel.fromJson(Map<String, dynamic> json) => DrinksModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
