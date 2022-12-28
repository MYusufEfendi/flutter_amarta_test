import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../todos_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    storageConfiguration();
    super.onInit();
  }

  var list = <Todos>[].obs;
  final box = GetStorage();
  var inpC = TextEditingController();
  var boxKey = "TodosListKey";

  Future<void> storageConfiguration() async {
    await GetStorage.init();
    if (box.read(boxKey).toString() != "null") {
      var read = box.read(boxKey) as List<dynamic>;
      for (var e in read) {
        list.add(Todos(
          isSelected: e['isSelected'],
          id: e['id'],
          name: e['name'],
        ));
      }
    }
  }

  bool onAdd({var name, var id, var isSelected}) {
    var data = Todos(
      name: name,
      id: id,
      isSelected: isSelected,
    );
    list.add(data);
    list.refresh();
    return true;
  }

  Future<void> saveData() async {
    await GetStorage.init();
    box.write(boxKey, list);
    inpC.clear();
  }

  Future<void> onSelect({required int index,required List<Todos> data}) async {
    await GetStorage.init();
    data[index].isSelected = data[index].isSelected == true ? false : true;
    box.write(boxKey, list);
    list.refresh();
  }
}
