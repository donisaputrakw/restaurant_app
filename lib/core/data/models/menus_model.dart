import 'package:restaurant_app/core/core.dart';

class MenusModel {
  final List<FoodsModel> foods;
  final List<DrinksModel> drinks;

  MenusModel({
    required this.foods,
    required this.drinks,
  });

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        foods: List<FoodsModel>.from(
          json['foods'].map((x) => FoodsModel.fromJson(x)),
        ),
        drinks: List<DrinksModel>.from(
          json['drinks'].map((x) => DrinksModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'foods': List<dynamic>.from(foods.map((x) => x.toJson())),
        'drinks': List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
