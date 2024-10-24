import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_first_app/features/domain/usecase/serach_food_usecase.dart';
import 'package:my_first_app/features/presentation/bloc/food_event.dart';
import 'package:my_first_app/features/presentation/bloc/food_state.dart';

class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  final SearchFoodUseCase _searchFoodUseCase;

  FoodSearchBloc({required SearchFoodUseCase searchFoodUseCase})
      : _searchFoodUseCase = searchFoodUseCase,
        super(FoodSearchInitial()) {
    on<SearchFood>(_loadFoods);
  }

  Future<void> _loadFoods(
    SearchFood event,
    Emitter<FoodSearchState> emit,
  ) async {
    emit(FoodSearchLoading());
    try {
      final foods = await _searchFoodUseCase.call(event.query);
      emit(FoodSearchLoaded(foods));
    } catch (e) {
      emit(FoodSearchError(e.toString()));
    }
  }
}

@override
Stream<FoodSearchState> mapEventToState(FoodSearchEvent event) async* {
  if (event is SearchFood) {}
}
