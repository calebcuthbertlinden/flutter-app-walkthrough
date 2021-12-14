import 'dart:convert';
import 'package:http/http.dart' as http;

class PetFactsApiProvider {

  final String endpoint =
      "https://catfact.ninja/";

  Future<List<dynamic>> getListFromApi() async {
    final path = Uri.parse(endpoint + 'facts?max_length=200&limit=10');
    try {
      final response = await http.get(path);
      if (response.statusCode == 200) {
        Map<String, dynamic> mappedResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return mappedResponse["data"] as List<dynamic>;
      } else {
        return <dynamic>[];
      }
    } catch (error) {
      return <dynamic>[];
    }
  }
}
