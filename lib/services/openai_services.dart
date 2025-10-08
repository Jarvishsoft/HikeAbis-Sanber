import 'dart:convert';
import 'package:hike_abis/env/env.dart';
import 'package:hike_abis/models/openai_model/openai_model.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  // Mengirim permintaan ke OpenAI API dan mendapatkan respons.
  Future<String?> getRecommendation(String userMessage) async {
    final url = Uri.parse('https://api.openai.com/v1/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Env.apiKey}', // API key dari .env
    };
    final body = json.encode({
      "model": "gpt-3.5-turbo",
      "prompt": userMessage,
      "max_tokens": 150,
      "temperature": 0.7,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final gptData = GPTData.fromJson(data);

        if (gptData.choices.isNotEmpty) {
          return gptData.choices.first.text;
        }
      }
    } catch (e) {
      print('Error fetching recommendation: $e');
    }

    return null; // Jika terjadi kesalahan atau respons kosong.
  }
}
