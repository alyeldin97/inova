import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../configs/constants/hive.dart';
import '../configs/constants/http_codes.dart';
import '../configs/constants/json_keys.dart';
import 'hive_helper.dart';
import 'network_error_helper.dart';
import 'failures.dart';

abstract class NetworkService {
  Future<dynamic> getRequest(url);
}

class HTTPsService implements NetworkService {
  @override
  Future<dynamic> getRequest(url) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      bool isSuccess = response.statusCode < HttpCodes.success;
      if (isSuccess) {
        return jsonDecode(response.body);
      } else {
        Map errorBody = jsonDecode(response.body);
        String key = errorBody.entries.first.key;
        String message = errorBody[key];
        int statusCode = response.statusCode;
        Failure failure =
            Failure(code: statusCode, messageEn: message, messageAr: message);
        throw failure;
      }
    } catch (e) {
      rethrow;
    }
  }
}
