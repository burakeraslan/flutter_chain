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
                        ],
                      ),
                    ).paddingAll(10),
                  )
                  .toList(),
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
