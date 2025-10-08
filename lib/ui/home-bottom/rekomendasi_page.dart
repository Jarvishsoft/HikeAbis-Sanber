import 'package:flutter/material.dart';
import 'package:hike_abis/services/openai_services.dart';
import 'package:hike_abis/theme/theme.dart';

class RekomendasiPage extends StatefulWidget {
  @override
  _RekomendasiPageState createState() => _RekomendasiPageState();
}

class _RekomendasiPageState extends State<RekomendasiPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  final OpenAIService _openAIService = OpenAIService();
  String? _errorMessage;
  bool isLoading = false;

  Future<void> _sendMessage() async {
    if (_controller.text.trim().isEmpty) {
      setState(() {
        _errorMessage = 'Command tidak boleh kosong!';
      });
      return;
    } else {
      setState(() {
        _errorMessage = null;
      });
    }
    // tutup keyboard setelah submit
    FocusScope.of(context).unfocus();

    setState(() {
      _messages.add('You : ${_controller.text}');
      _messages.add('Bot : typing...');
      isLoading = true;
      _controller.clear();
    });

    final response = await _openAIService.getRecommendation(_controller.text);

    setState(() {
      _messages.removeLast();
      if (response != null) {
        _messages.add('Bot : $response');
      } else {
        _messages.add('Bot : Maaf tidak ada rekomendasi yang tersedia');
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rekomendasi AI',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Align(
                      alignment: _messages[index].startsWith('You :')
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Material(
                        color: _messages[index].startsWith('You :')
                            ? const Color(0xFF83A1D6)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            _messages[index],
                            style: TextStyle(
                              color: _messages[index].startsWith('You :')
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tanyakan sesuatu...',
                      hintStyle: const TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ),
                isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
