import 'package:cim_training/model/book.dart';
import 'package:http/http.dart' as http;

class BookApi {
  static var client = http.Client();

  static Future<List<Book>> fetchBookData() async {
    var response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      print(response.body);
      return bookFromJson(response.body);
    } else {
      print('Cannot download');
      return [];
    }
  }
}
