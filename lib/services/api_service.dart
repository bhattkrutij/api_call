import 'package:apicall/models/photos.dart';
import 'package:http/http.dart' show Client;
import '../models/profile.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/";
  Client client = Client();

  Future<bool?> getProfiles() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      print("response code 200${response.body}");
      List<Profile> users = profileFromJson(response.body);
      for (var user in users) {
        print('Name: ${user.name}');
        if (user.name == "Leanne Graham") {
          return true;
        } else {
          return false;
        }
      }

      //  return profileFromJson(response.body);
    } else {
      return false;
    }
    return null;
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

  Future<List<Photos>?> getPhotos() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      print("response code 200${response.body}");
      List<Photos> photos = photosFromJson(response.body);
      for (var user in photos) {
        print('Name: ${user.thumbnailUrl}');
      }

      return photosFromJson(response.body);
    } else {
      return null;
    }
  }
}
