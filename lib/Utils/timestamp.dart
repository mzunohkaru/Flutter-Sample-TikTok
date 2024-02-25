import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    if (json is Timestamp) {
      return json;
    }
    if (json is Map<String, dynamic>) {
      return Timestamp.fromMillisecondsSinceEpoch(json['millisecondsSinceEpoch']);
    }
    return Timestamp.now();
  }

  @override
  dynamic toJson(Timestamp object) => object;
}