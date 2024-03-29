import 'package:bloc_and_dio_test/model/message.dart';
import 'package:bloc_and_dio_test/model/user.dart';
import 'dart:convert';

class Recover {
  User user;
  Message message;

  Recover({required this.user, required this.message});

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'message': message
    };
  }

  factory Recover.fromMap(Map<String, dynamic> map) {

    return Recover(
        user: map['user'] ?? '',
        message: map['message'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory Recover.fromJson(String source) =>
      Recover.fromMap(json.decode(source));
}