import 'dart:convert';
import 'package:JSON_serialization_deserialization/user.dart';

class Customer {
  int? id;
  String? name;

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }  
}

class Order {
  int? orderId;
  Customer? customer;
  double? total;

  fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    var c = Customer();
    c.fromJson(json['customer']);
    customer = c;
    total = json['total'];
  }
  
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'customer': customer?.toJson(),
      'total': total
    };
  }
}

/*
class User {
  int? id;
  String? name;
  String? email;

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email
    };
}
*/

void main() {
  String jsonString = '{"id": 1, "name": "Alice", "email": "alice@example.com"}';
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  User user = User.fromJson(jsonMap);
  var userMap = jsonEncode(user.toJson());
  print(user.toJson());
  print(userMap);
}

List<User> parseUsers(String jsonStr) {
  List<dynamic> data = jsonDecode(jsonStr);
  return data.map((json) => User.fromJson(json as Map<String, dynamic>)).toList();
}
