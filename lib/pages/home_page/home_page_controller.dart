import 'package:flutter_chain/models/task_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomePageController extends GetxController {
  final box = Hive.box<TaskModel>('chainTasks');
  List<TaskModel> get list => box.values.toList();
}
