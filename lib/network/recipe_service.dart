import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart';

const String apiKey = '0912a24af4a2722d9844c1d3623588a7	';
const String apiId = '9f4204ab';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  Future getData(String url) async {
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      log(response.body);
    }
  }

  // TODO: Add getRecipes
  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
