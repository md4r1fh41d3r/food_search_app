import 'package:my_first_app/features/data/model/food_model.dart';
import 'package:my_first_app/features/domain/entity/food_entity.dart';
import 'package:my_first_app/features/domain/repository/food_repo.dart';

class SearchFoodUseCase {
  final FoodRepository repository;

  SearchFoodUseCase(this.repository);

  Future<List<FoodModel>> call(String query) async {
    return await repository.searchFood(query);
  }
}
