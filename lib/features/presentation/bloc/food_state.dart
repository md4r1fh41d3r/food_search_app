import 'package:equatable/equatable.dart';
import 'package:my_first_app/features/data/model/food_model.dart';
import 'package:my_first_app/features/domain/entity/food_entity.dart';

abstract class FoodSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FoodSearchInitial extends FoodSearchState {}

class FoodSearchLoading extends FoodSearchState {}

class FoodSearchLoaded extends FoodSearchState {
  final List<FoodModel> foods;

  FoodSearchLoaded(this.foods);

  @override
  List<Object?> get props => [foods];
}

class FoodSearchError extends FoodSearchState {
  final String message;

  FoodSearchError(this.message);

  @override
  List<Object?> get props => [message];
}
