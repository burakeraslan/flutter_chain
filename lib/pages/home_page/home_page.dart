import 'package:flutter/material.dart';
import 'package:flutter_chain/models/task_model.dart';
import 'package:flutter_chain/pages/add_page/add_page.dart';
import 'package:flutter_chain/pages/home_page/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    final box = Hive.box<TaskModel>('tasks');
    print(box.values.toList());
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Chain'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home Page'),
                InkWell(
                  child: const Text(
                    'Go to Add Page',
                    style: TextStyle(color: Colors.blue),
                  ).paddingAll(10),
                  onTap: () {
                    Get.to(() => const AddPage());
                  },
                )
              ],
            ),
          ));
    });
  }
}
