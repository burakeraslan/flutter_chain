import 'package:flutter/material.dart';
import 'package:flutter_chain/controllers/chain_controller.dart';
import 'package:flutter_chain/pages/add_page/add_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChainController());

    return GetBuilder<ChainController>(
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
              children: controller.list
                  .map(
                    (task) => Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.yellow,
                      child: Column(
                        children: [
                          Text(task.task),
                          Text(task.description),
                          Text(
                            task.chain.length.toString(),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                for (var i = 0; i < task.chain.length; i++)
                                  if (task.chain[i]['chainDay'] == true)
                                    InkWell(
                                      onTap: () {
                                        controller.box.getAt(controller.list.indexOf(task))!.chain[i]['isDone'] =
                                            !controller.box.getAt(controller.list.indexOf(task))!.chain[i]['isDone']!;
                                        controller.update();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: task.chain[i]['isDone'] == true ? Colors.greenAccent : Colors.white,
                                        ),
                                        child: Text(
                                          task.chain[i]['date'].day.toString(),
                                        ),
                                      ).paddingAll(5),
                                    ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(task.chain.where((element) => element['chainDay'] == true).toList());
                            },
                            child: const Icon(
                              Icons.details,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ).paddingAll(10),
                  )
                  .toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black54,
            elevation: 0,
            onPressed: () {
              Get.to(() => const AddPage());
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
