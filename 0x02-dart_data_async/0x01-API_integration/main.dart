import 'dart:convert';
import 'package:http/http.dart';

void main() async {
  print(JsonEncoder.withIndent('  ').convert(await fetchPost()));
  print(await fetchPostTitles());
  print(await sendPost());
}

Future<Map<String, String>> fetchPost() async {
  Map<String, String> dataMap = {'title': '', 'body': ''};
  try {
    var data = await getJsonResponse(
      'https://jsonplaceholder.typicode.com/posts/1',
    );
    dataMap['title'] = data['title'].toString();
    dataMap['body'] = data['body'].toString();
    return dataMap;
  } catch (ex) {
    print("Error retrieving data: $ex");
    return {};
  }
}

Future<List<String>> fetchPostTitles() async {
  List<String> titles = [];
  String url = "https://jsonplaceholder.typicode.com/posts";
  for (int i = 1; i <= 100; i++) {
    var data = await getJsonResponse("$url/$i");
    titles.add(data['title'].toString());
  }
  return titles;
}

Future sendPost() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  Map data = {"title": "Hello", "body": "This is a test post", "userId": 1};
  var body = json.encode(data);
  var response = await post(
    url,
    headers: {'Content-type': 'application/json; charset=UTF-8'},
    body: body,
  );
  var returnValue = jsonDecode(response.body);
  return (returnValue['id']);
}

Future<Map<dynamic, dynamic>> getJsonResponse(String url) async {
  var response = await get(Uri.parse(url));
  return jsonDecode(response.body);
}
