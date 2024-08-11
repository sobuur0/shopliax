import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/photo/photo.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse('$baseUrl/photos'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Photo.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
