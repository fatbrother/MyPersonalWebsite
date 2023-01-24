import 'package:http/http.dart' as http;

class Crawler {
  static Future<String> getApi(String url) async {
    String content = '';
    try {
      var result = await http.get(Uri.parse(url));
      content = result.body;
    } catch (e) {
      rethrow;
    }
    return content;
  }
}
