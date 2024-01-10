import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tech_news/core/api_key.dart';

Future<List>fetchNews()async{
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=${apiKey.key}"
    ),);
    Map result = jsonDecode(response.body);
    print("Fetched API");
    return(result["articles"]);
}