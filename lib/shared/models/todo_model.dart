import 'package:uuid/uuid.dart';

class TodoModel {

  TodoModel({
    required this.title,
    String? cId,
    this.description,
    DateTime? cDate,
  })  : id = cId ?? const Uuid().v4(),
        date = cDate ?? DateTime.now();

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      cId: map['id'] as String?,
      title: map['title'] as String? ?? '',
      description: map['description'] as String?,
      cDate: DateTime.fromMillisecondsSinceEpoch(map['date']! as int),
    );
  }

  final String id;
  final String title;
  final String? description;
  final DateTime date;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
    };
  }
}
