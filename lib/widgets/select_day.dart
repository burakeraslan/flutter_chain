import 'package:flutter/material.dart';
import 'package:flutter_chain/controllers/chain_controller.dart';

class SelectDay extends StatelessWidget {
  final ChainController controller;
  final int index;
  final String day;

  const SelectDay({
    super.key,
    required this.controller,
    required this.index,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          controller.days[index] = !controller.days[index]!;
          controller.update();
          print(controller.days.map((key, value) => MapEntry(key, value)));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: controller.days[index]! ? Colors.black : Colors.grey,
          ),
          child: Text(
            day,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
