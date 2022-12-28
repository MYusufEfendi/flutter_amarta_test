class Todos {
  int? id;
  String? name;
  bool? isSelected;

  Todos({this.id, this.name, this.isSelected});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['isSelected'] = isSelected;
    return data;
  }
}
