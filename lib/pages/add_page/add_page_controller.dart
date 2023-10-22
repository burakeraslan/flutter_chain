import 'package:flutter/material.dart';
import 'package:flutter_chain/models/task_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive_flutter/adapters.dart';

class AddPageController extends GetxController {
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    if (picked != selectedDate) {
      selectedDate = picked ?? DateTime.now();
    }
    update();
  }

  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  late int selectedDay;

  Map<int, bool> days = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
  };

  final box = Hive.box<TaskModel>('tasks');
}
