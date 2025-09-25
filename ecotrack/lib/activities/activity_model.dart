import 'activity.dart';

class ActivityModel extends Activity {
  const ActivityModel({
    required String id,
    required String type,
    required double co2Kg,
    required DateTime date,
  }) : super(id: id, type: type, co2Kg: co2Kg, date: date);

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] ?? '',
      type: json['type'] ?? 'Desconocido',
      co2Kg: (json['co2Kg'] as num).toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'co2Kg': co2Kg,
      'date': date.toIso8601String(),
    };
  }
}
