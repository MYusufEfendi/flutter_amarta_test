// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_amarta/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test_amarta/app/modules/home/todos_model.dart';

import 'package:flutter_test_amarta/main.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  test('Test jika add data', () {
    final homeC = HomeController();
    homeC.onAdd();
    expect(homeC.list.length, isNotEmpty);
  });

  test('Test save data', () {
    final homeC = HomeController();
    homeC.saveData();
    expect(homeC.inpC.text, "");
  });

  test('Test jika select data', () {
    final homeC = Get.put(HomeController());
    var data = Todos(isSelected: false, id: 0, name: "yuhan");
    homeC.list.add(data);
    var oldData = homeC.list[0].isSelected as bool;
    homeC.onSelect(index: 0, data: homeC.list);
    expect(homeC.list[0].isSelected, oldData);
  });
}
