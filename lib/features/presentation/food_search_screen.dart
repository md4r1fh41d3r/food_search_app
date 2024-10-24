import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/features/presentation/bloc/food_bloc.dart';
import 'package:my_first_app/features/presentation/bloc/food_event.dart';
import 'package:my_first_app/features/presentation/bloc/food_state.dart';

class FoodSearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search Food',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    BlocProvider.of<FoodSearchBloc>(context).add(
                      SearchFood(_controller.text),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<FoodSearchBloc, FoodSearchState>(
              builder: (context, state) {
                if (state is FoodSearchLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FoodSearchLoaded) {
                  return ListView.builder(
                    itemCount: state.foods.length,
                    itemBuilder: (context, index) {
                      final food = state.foods[index];
                      return Card(
                        child: ListTile(
                          title: Text(food.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (food.brandName != null)
                                Text('Brand: ${food.brandName}'),
                              Text('Type: ${food.description}'),
                              Text(food.foodDescription),
                              SizedBox(height: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL(food.foodUrl);
                                },
                                child: Text('View More Details'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is FoodSearchError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    // Implement a URL launcher to open the food URL in a browser
  }
}
