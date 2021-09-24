import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String date;
  @HiveField(4)
  int priority;

  Note(this.id, this.title, this.date, this.priority, this.description);
}
