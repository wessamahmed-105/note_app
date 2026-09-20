import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  bool isArchived;

  @HiveField(4)
  bool isDeleted;

  @HiveField(5)
  bool isReminder;

  NoteModel({
    required this.title,
    required this.content,
    required this.createdAt,
    this.isArchived = false,
    this.isDeleted = false,
    this.isReminder = false,
  });
}
