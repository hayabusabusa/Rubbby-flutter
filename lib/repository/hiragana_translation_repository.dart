import 'package:flutter/material.dart';

import 'package:rubbby/secrets.dart';
import 'package:rubbby/model/model.dart';
import 'package:rubbby/repository/hiragana_translation_api_client.dart';

class HiraganaTranslationRepository {
  final HiraganaTranslationApiClient apiClient;

  HiraganaTranslationRepository({
    @required this.apiClient
  }) : assert(apiClient != null);

  Future<Translation> postSentence(String sentence, OutputType outputType) async {
    final String appId = applicatonId;
    final PostSentenceParams params = PostSentenceParams(appId: appId, sentence: sentence, outputType: outputType);
    return apiClient.postSentence(params);
  }
}