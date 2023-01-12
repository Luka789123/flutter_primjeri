import 'dart:convert';

import 'package:activity_app/core/entity/activity.dart';

class ActivityModel extends Activity {
  ActivityModel(
      {required super.activtiyName,
      required super.participants,
      required super.price,
      required super.accessibility});

  factory ActivityModel.fromJson(String value) {
    Map<String, dynamic> jsonMap = json.decode(value);
    return ActivityModel(
        activtiyName: jsonMap['activity'],
        participants: (jsonMap['participants'] as num).toInt(),
        price: (jsonMap['price'] as num).toDouble(),
        accessibility: (jsonMap['accessibility'] as num).toDouble());
  }
}
