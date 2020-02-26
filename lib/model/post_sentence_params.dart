import 'package:flutter/material.dart';
import 'package:rubbby/model/output_type.dart';

class PostSentenceParams {
  final String appId;
  final String sentence;
  final OutputType outputType;

  PostSentenceParams({
    @required this.appId,
    @required this.sentence,
    @required this.outputType,
  });

  Map<String, dynamic> toJson() {
    return {
      'app_id': this.appId,
      'sentence': this.sentence,
      'output_type': OutputTypeHelper.mapToString(this.outputType)
    };
  }
}