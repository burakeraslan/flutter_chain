import 'package:flutter/material.dart';
import 'package:flutter_chain/pages/add_page/add_page_controller.dart';
import 'package:flutter_chain/widgets/select_day.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPageController());
    return GetBuilder<AddPageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.taskController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Yeni Görev Ekle',
              ),
              onSubmitted: (value) {
                controller.taskController.text = value;
              },
            ).paddingAll(20),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Açıklama Ekle',
              ),
              onSubmitted: (value) {
                controller.descriptionController.text = value;
              },
            ).paddingAll(20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.selectDate(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Tarih Seç'),
                ),
                Text(
                  '${controller.selectedDate.day}/${controller.selectedDate.month}/${controller.selectedDate.year}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const Text('Rutin Seç:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectDay(
                  controller: controller,
                  index: 1,
                  day: 'Pzt',
                ),
                SelectDay(
                  controller: controller,
                  index: 2,
                  day: 'Sal',
                ),
                SelectDay(
                  controller: controller,
                  index: 3,
                  day: 'Çar',
                ),
                SelectDay(
                  controller: controller,
                  index: 4,
                  day: 'Per',
                ),
                SelectDay(
                  controller: controller,
                  index: 5,
                  day: 'Cum',
                ),
                SelectDay(
                  controller: controller,
                  index: 6,
                  day: 'Cmt',
                ),
                SelectDay(
                  controller: controller,
                  index: 7,
                  day: 'Paz',
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print(
                    '${controller.taskController.text} ${controller.descriptionController.text} ${controller.selectedDate} ${controller.days.map((key, value) => MapEntry(key, value))}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text('Kaydet'),
            ),
          ],
        ),
      );
    });
  }
}
