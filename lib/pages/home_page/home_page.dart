import 'package:flutter/material.dart';
import 'package:flutter_chain/pages/add_page/add_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
