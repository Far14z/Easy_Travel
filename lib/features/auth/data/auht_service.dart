import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constant/api_const.dart';
import 'package:easy_travel/features/auth/domain/user.dart';
import 'package:http/http.dart' as http;

class AuhtService {

  Future<User> login(String email, String password) async {
    try {
      final Uri uri = Uri.parse(ApiConstants.baseUrl);

      final http.Response response = await http.post(
        uri,
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);
        return User.fromJson(json);
      }

      if (response.statusCode == HttpStatus.notFound) {
        throw HttpException('No destinations found (404)');
      }

      if (response.statusCode >= 500) {
        throw HttpException('Server error ${response.statusCode}');
      }

      throw HttpException('Unexpected HTTP Status: ${response.statusCode}');
    } on SocketException {
      throw const SocketException('Failed to stablish network connection');
    } on FormatException catch (e) {
      throw FormatException('Failed to parse reponse $e');
    } catch (e) {
      throw Exception('Unexpect error while fetchng destinations: $e');
    }
  }
}
