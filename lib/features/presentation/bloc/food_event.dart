import 'package:equatable/equatable.dart';

abstract class FoodSearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchFood extends FoodSearchEvent {
  final String query;

  SearchFood(this.query);

  @override
  List<Object?> get props => [query];
}
