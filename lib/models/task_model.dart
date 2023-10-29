import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String task;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final Map days;
  @HiveField(3)
  final List<Map> chain;

  TaskModel({
    required this.task,
    required this.description,
    required this.days,
    required this.chain,
  });
}
