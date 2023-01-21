import 'package:http/http.dart' as http;

class Crawler {
  static Future<String> getApi(String url) async {
    String content = '';
    try {
      String corsUrl = 'https://cors-anywhere.herokuapp.com/';
      var result = await http.get(Uri.parse(corsUrl + url));
      content = result.body;
    } catch (e) {
      rethrow;
    }
    return content;
  }
}