import 'package:my_first_app/features/domain/entity/food_entity.dart';

class FoodModel extends FoodEntity {
  final String? brandName;
  final String foodDescription;
  final String foodUrl;

  FoodModel({
    required String name,
    required int foodId,
    required String foodType,
    this.brandName,
    required this.foodDescription,
    required this.foodUrl,
  }) : super(
          name: name,
          foodId: foodId,
          description: foodType,
        );

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['food_name'],
      foodId: int.parse(json['food_id']),
      foodType: json['food_type'],
      brandName: json['brand_name'], // This will be null for generic foods
      foodDescription: json['food_description'],
      foodUrl: json['food_url'],
    );
  }

  static List<FoodModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FoodModel.fromJson(json)).toList();
  }
}
