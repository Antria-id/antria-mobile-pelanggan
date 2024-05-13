import 'dart:convert';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/user_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String USER_CACHE_KEY = 'usercache';

class UserCacheService {
  UserModel? _user;
  UserModel? get user => _user;
  SharedPreferences get sharedPrefs => serviceLocator<SharedPreferences>();

  Future<void> saveAccessToken(String accessTokenResponse) async {
    try {
      if (accessTokenResponse.isEmpty) {
        print("Access token response is empty");
        return;
      }

      // Split the response to extract the access token
      List<String> tokenParts = accessTokenResponse.split(".");
      if (tokenParts.length != 3) {
        print("Invalid access token format");
        return;
      }

      // Extract the payload part and add padding characters if needed
      String payloadBase64 = tokenParts[1];
      while (payloadBase64.length % 4 != 0) {
        payloadBase64 += "=";
      }

      // Decode the payload from the access token
      String payloadString = utf8.decode(base64Url.decode(payloadBase64));
      Map<String, dynamic> payload = jsonDecode(payloadString);

      // Create a UserModel object from the decoded payload
      UserModel user = UserModel(
        sub: payload['sub'],
        username: payload['username'],
        role: payload['role'],
      );

      await saveUser(user);
    } catch (e, stackTrace) {
      throw ('Error saving access token to cache: $e\nStack trace: $stackTrace');
    }
  }

  Future<bool> saveUser(UserModel user) async {
    try {
      var map = user.toJson();
      bool saved = await sharedPrefs.setString(USER_CACHE_KEY, jsonEncode(map));
      if (saved) {
        _user = user;
      }
      return saved;
    } catch (e, stackTrace) {
      print('Error saving user to cache: $e\nStack trace: $stackTrace');
      return false;
    }
  }

  Future<UserModel?> getUser() async {
    UserModel usr;
    var userMap = sharedPrefs.getString(USER_CACHE_KEY);
    if (userMap == null) {
      return null;
    }
    usr = UserModel.fromJson(jsonDecode(userMap));
    _user = usr;
    return usr;
  }

  Future<bool> deleteUser() async {
    try {
      _user = null;
      return await sharedPrefs.remove(USER_CACHE_KEY);
    } catch (e, stackTrace) {
      print('Error deleting user from cache: $e\nStack trace: $stackTrace');
      return false;
    }
  }
}
