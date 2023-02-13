import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

//* chatgpt dev api key
var apiKey = dotenv.env['api_key'];

class ApiService {
//* base url for text
  static String baseUrlText = "https://api.openai.com/v1/completions";

//* base url for image
  static String baseUrlImage = "https://api.openai.com/v1/images/generations";

//* header of the json
  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer $apiKey",
  };

  //* function to send text message
  static sendMessage(String? message) async {
    var res = await http.post(
      Uri.parse(baseUrlText),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": "$message",
        "temperature": 0,
        "max_tokens": 100,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["Human:", "AI:"]
      }),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      var msg = data['choices'][0]['text'];
      return msg;
    } else {
      print('failed to fetch data');
    }
  }

  //* function to generate image
  static generateImg(String question) async {
    var res = await http.post(
      Uri.parse(baseUrlImage),
      headers: header,
      body: jsonEncode(
        {
          "prompt": question,
          "n": 1,
          "size": "256x256",
        },
      ),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      print(data);
      var img = data['data'][0]['url'].toString();
      print(img);
      return img;
    } else {
      print('failed to fetch data');
    }
  }
}
