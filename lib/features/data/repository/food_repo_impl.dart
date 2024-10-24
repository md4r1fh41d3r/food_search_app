import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_app/features/data/model/food_model.dart';
import 'package:my_first_app/features/domain/entity/food_entity.dart';
import 'package:my_first_app/features/domain/repository/food_repo.dart';

class FoodRepositoryImpl implements FoodRepository {
  final String clientId;
  final String clientSecret;

  FoodRepositoryImpl({required this.clientId, required this.clientSecret});

  Future<String> _getAccessToken() async {
    var auth = 'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret'));

    final response = await http
        .post(Uri.parse('https://oauth.fatsecret.com/connect/token'), headers: {
      'Authorization': auth,
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      'grant_type': 'client_credentials',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return body['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }

  @override
  Future<List<FoodModel>> searchFood(String query) async {
    String token = await _getAccessToken();
    final response = await http.get(
      Uri.parse(
          'https://platform.fatsecret.com/rest/foods/search/v1?search_expression=$query&format=json&page_number=0&max_results=10'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      print(body);
      List<dynamic> foodList = body['foods']['food'];
      return FoodModel.fromJsonList(foodList);
    } else {
      throw Exception('Failed to load foods');
    }
  }
}
