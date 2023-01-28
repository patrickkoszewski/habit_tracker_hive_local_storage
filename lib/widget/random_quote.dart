import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class Quote {
  final String quote;
  final String author;

  Quote({required this.quote, required this.author});
}

class QuoteService {
  late String author;
  Future<Quote> getRandomQuote() async {
    var response = await http.get(Uri.parse(
        "http://my-json-server.typicode.com/patrickkoszewski/mockjson/db"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var quotes = data['quotes'] as List;
      var randomIndex = Random().nextInt(quotes.length);

      author = quotes[randomIndex]['author'];
      var quote = quotes[randomIndex]['quote'];
      return Quote(quote: quote, author: author);
    } else {
      throw Exception('Nie udało się pobrać cytatu');
    }
  }
}
