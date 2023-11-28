import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://openlibrary.org/";

  static Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class BookRepository {
  static Future<http.Response> getCurrentlyReadingBooks() {
    final endpoint = 'people/mekBot/books/currently-reading.json';
    return BaseNetwork.get(endpoint);
  }
}

Future<http.Response> fetchDataFromApi() async {
  try {
    final response = await BookRepository.getCurrentlyReadingBooks();
    return response; // Return the response or process the data and return what you need
  } catch (e) {
    print('Error: $e');
    rethrow; // Re-throw the exception to propagate it further if needed
  }
}