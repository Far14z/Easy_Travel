import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constant/api_const.dart';
import 'package:easy_travel/core/storage/token_storage.dart';
import 'package:easy_travel/features/home/domain/models/review.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  Future<List<Review>> getReviewsByDestinationId(int id) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: '${ApiConstants.registerEndpoint}/$id}');

    try {
      final response = await http.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        List jsons = jsonDecode(response.body);
        return jsons.map((json) => Review.fromJson(json)).toList();
      }
      return Future.error(
        '${response.statusCode}'
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> submitReview(int id, String commment, int rating) async {
    final Uri uri = Uri.parse(ApiConstants.baseUrl).replace(path: ApiConstants.registerEndpoint);

    try {
      final token = await TokenStorage().read();
      final response = await http.post(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        
      }, body: jsonEncode({
        'destinationId': id,
        'comment': commment,
        'rating': rating,
      }));

      if (response.statusCode != HttpStatus.created) {
        return Future.error(
          '${response.statusCode}'
        );
      }

    } catch(e) {
      return Future.error(e.toString());
    }
  }
}
