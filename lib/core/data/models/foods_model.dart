class FoodsModel {
  final String name;

  FoodsModel({
    required this.name,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
