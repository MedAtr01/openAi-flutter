import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  final String apiUrl = 'http://localhost:8080/chat/';

  Future<String> getChatbotResponse(String message) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get response from chatbot');
    }
  }
}
