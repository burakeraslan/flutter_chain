import 'package:flutter/material.dart';
import 'package:flutter_chain/models/task_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

class AddPageController extends GetxController {
  final box = Hive.box<TaskModel>('chainTasks');

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

  late List<Map> chain;

  void updateChain() {
    DateTime now = DateTime.now();
    if (box.isNotEmpty) {
      for (int i = 0; i < box.length; i++) {
        if (box.getAt(i)!.chain.last['date'].day != now.day || box.getAt(i)!.chain.last['date'].month != now.month || box.getAt(i)!.chain.last['date'].year != now.year) {
          DateTime lastDate = box.getAt(i)!.chain.last['date'];
          DateTime addDate = lastDate.add(const Duration(days: 1));

          if (box.getAt(i)?.days[addDate.weekday] == true) {
            chain = [
              {
                'date': addDate,
                'weekDay': addDate.weekday,
                'isDone': false,
                'chainDay': true,
              },
            ];
          } else {
            chain = [
              {
                'date': addDate,
                'weekDay': addDate.weekday,
                'isDone': false,
                'chainDay': false,
              },
            ];
          }

          box.getAt(i)!.chain.addAll(chain);
          updateChain();
        }
      }
    }
  }
}
