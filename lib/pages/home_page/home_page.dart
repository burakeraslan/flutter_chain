import 'package:flutter/material.dart';
import 'package:flutter_chain/pages/add_page/add_page.dart';
import 'package:flutter_chain/pages/home_page/home_page_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: const Icon(
              Icons.all_inclusive,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // children: controller.list
              //     .map(
              //       (task) => Container(
              //         padding: const EdgeInsets.all(10),
              //         width: double.infinity,
              //         height: 400,
              //         color: Colors.yellow,
              //       ).paddingAll(10),
              //     )
              //     .toList(),
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('tıklat'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.box.clear();
                  },
                  child: const Text('Localı temizle'),
                ),
                ElevatedButton(
                  onPressed: () {
                    for (var i = 0; i < controller.box.length; i++) {
                      final task = controller.box.getAt(i)!;
                      print(task.task);
                      print(task.description);
                      print(task.days);
                      print(task.chain);
                    }
                  },
                  child: const Text('localı print et'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              Get.to(() => const AddPage());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
