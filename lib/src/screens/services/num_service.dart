import 'package:http/http.dart' as http;

class NumberService {
  Future<String> getInfo({required String numb}) async {
    String apiEndPoint = 'http://numbersapi.com/$numb';
    http.Response response = await http.get(Uri.parse(apiEndPoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error';
    }
  }
}
