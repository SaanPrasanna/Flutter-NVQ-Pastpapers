import 'dart:convert';

import 'package:pastpapers/core/models/past_papers.dart';
import 'package:http/http.dart' as http;
import 'package:pastpapers/core/services/api_key.dart';

class APIService {
  static const String endpoint = "API_URL";

  final clinet = http.Client();
  String apiKey = APIKey.apiKey;

  Future<PastPaper> getPapers() async {
    final queryParameters = {
      "api_key": "$apiKey",
    };

    try {
      final uri = Uri.http(endpoint, 'URL_ENDPOINT', queryParameters);
      final response = await clinet.get(
        uri,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
      );

      if (response.statusCode == 200) {
        return PastPaper.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.message);
    }
    return null;
  }
}
