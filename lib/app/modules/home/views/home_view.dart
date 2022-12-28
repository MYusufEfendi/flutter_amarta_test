import 'package:flutter/material.dart';
import 'package:flutter_test_amarta/app/modules/home/todos_model.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
              itemCount:
                  controller.list.isNotEmpty ? controller.list.length : 0,
              itemBuilder: (context, index) {
                var data = controller.list[index];
                return ListData(data, index);
              }),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          aadDialog(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Container ListData(Todos data, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {
          controller.onSelect(index: index, data: controller.list);
        },
        child: ListTile(
          title: Text(
            data.name.toString(),
            style: TextStyle(
                color: data.isSelected == true ? Colors.grey : Colors.black,
                decoration: data.isSelected == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          leading: CircleAvatar(
            child: Text(data.name.toString()[0]),
          ),
        ),
      ),
    );
  }

  Future<dynamic> aadDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add new todo item"),
          content: TextField(
            controller: controller.inpC,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'type your new todo',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Add"),
              onPressed: () {
                if (controller.onAdd(
                    isSelected: false,
                    id: controller.list.length + 1,
                    name: controller.inpC.text)) {
                  controller.saveData();
                  Get.back();
                }
              },
            )
          ],
        );
      },
    );
  }
}
