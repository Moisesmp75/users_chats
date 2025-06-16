import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_app/models/message.dart';

class YesNoApiService {

  final _url = Uri.parse('https://yesno.wtf/api');

  Future<Message> getAnswer() async {
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // final yesNoModel = YesNoModel.fromJsonMap(data).toMessageEntity();

      return Message.fromJson(data);
    } else {
      throw Exception('Error al obtener respuesta del API');
    }
  }
}