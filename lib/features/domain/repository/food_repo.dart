import 'package:my_first_app/features/data/model/food_model.dart';

abstract class FoodRepository {
  Future<List<FoodModel>> searchFood(String query);
}
