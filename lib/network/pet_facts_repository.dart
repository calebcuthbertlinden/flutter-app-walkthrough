
import 'package:flutter_app_walkthrough/network/pet_facts_api_provider.dart';

class PetFactsRepository{
  final PetFactsApiProvider _apiProvider = PetFactsApiProvider();

  Future<List<dynamic>> getListFromApi() {

    // If app has connection, call API, else read from cache

    return _apiProvider.getListFromApi();
  }

}