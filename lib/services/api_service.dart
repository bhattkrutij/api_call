import 'package:http/http.dart' show Client;

import '../models/profile.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/";
  Client client = Client();

  Future<List<Profile>?> getProfiles() async {
    final response =
        await client.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      print("response code 200${response.body}");
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProfile(Profile data) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/profile"),
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile data) async {
    final response = await client.put(
      Uri.parse("$baseUrl/api/profile/${data.id}"),
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await client.delete(
      Uri.parse("$baseUrl/api/profile/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
