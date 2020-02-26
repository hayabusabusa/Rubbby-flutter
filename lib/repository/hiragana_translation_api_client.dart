import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rubbby/model/model.dart';

class HiraganaTranslationApiClient {
  static const baseURL = 'https://labs.goo.ne.jp/api';
  final http.Client httpClient = http.Client();

  Future<Translation> postSentence(PostSentenceParams params) async {
    final url = baseURL + '/hiragana';
    final response = await httpClient.post(url, body: params.toJson());

    if (response.statusCode == 200) {
      return Translation.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post');
    }
  }
}