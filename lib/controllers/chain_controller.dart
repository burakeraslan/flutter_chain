import 'package:flutter/material.dart';
import 'package:flutter_chain/models/task_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ChainController extends GetxController {
  final box = Hive.box<TaskModel>('chainTasks');
  List<TaskModel> get list => box.values.toList();

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
          if (box.getAt(i)?.chain.last['date'].isBefore(now)) {
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

  void addTask() {
    if (days[selectedDate.weekday] == true) {
      chain = [
        {
          'date': selectedDate,
          'weekDay': selectedDate.weekday,
          'isDone': false,
          'chainDay': true,
        },
      ];
    } else {
      chain = [
        {
          'date': selectedDate,
          'weekDay': selectedDate.weekday,
          'isDone': false,
          'chainDay': false,
        },
      ];
    }

    if (taskController.text.isNotEmpty && days.containsValue(true)) {
      box.add(
        TaskModel(
          task: taskController.text,
          description: descriptionController.text,
          days: days,
          chain: chain,
        ),
      );
      taskController.clear();
      descriptionController.clear();
      days = {
        1: false,
        2: false,
        3: false,
        4: false,
        5: false,
        6: false,
        7: false,
      };
      selectedDate = DateTime.now();
      updateChain();
      update();
      Get.back();
    } else {
      Get.snackbar(
        'Hata',
        'Lütfen Görev ve Rutin alanlarını doldurunuz.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
