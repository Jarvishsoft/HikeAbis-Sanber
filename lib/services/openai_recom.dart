// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant/open_ai.dart';
import '../models/openai_model/openai_model.dart';
import '../models/openai_model/usage_model.dart';

class RecomendationService {
  static Future<GPTData> getRecommendation({
    required String gunung,
    required String cuaca,
    required String budget,
  }) async {
    late GPTData gptData = GPTData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: UsageModel(
        promptToken: 0,
        completionToken: 0,
        totalToken: 0,
      ),
    );

    try {
      var url = Uri.parse("https://api.openai.com/v1/completions");
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Charset": "utf-8",
        "Authorization": "Bearer $apiKey",
      };
      String prompt =
          "Berikut rekomendasi gunung $gunung yang cocok menjadi destinasi Anda, dengan perkiraan cuaca $cuaca, yang cocok serta budget $budget yang akan Anda keluarkan";
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": prompt,
        "max_tokens": 130,
        "temperature": 0.7,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });
      final response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return gptData;
  }
}
