import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/features/data/repository/food_repo_impl.dart';
import 'package:my_first_app/features/domain/usecase/serach_food_usecase.dart';
import 'package:my_first_app/features/presentation/bloc/food_bloc.dart';
import 'package:my_first_app/features/presentation/food_search_screen.dart';

void main() {
  final foodRepository = FoodRepositoryImpl(
      clientId: '7f281de431664c8bb7deff54af3d9ab4',
      clientSecret: '34fde7f78f9d446280f473b463de043f');

  runApp(MyApp(foodRepository: foodRepository));
}

class MyApp extends StatelessWidget {
  final FoodRepositoryImpl foodRepository;

  MyApp({required this.foodRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Search App',
      home: BlocProvider(
        create: (_) => FoodSearchBloc(
            searchFoodUseCase: SearchFoodUseCase(foodRepository)),
        child: FoodSearchScreen(),
      ),
    );
  }
}
