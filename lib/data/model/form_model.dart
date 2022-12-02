

class FormModel {
  int? id;
  String? date;
  String? time;
  String? description;
  String? title;

  FormModel(
      {this.id,
        this.date,
        this.time,
        this.description,
        this.title});

  FormModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['time'] = time;
    data['description'] = description;
    data['title'] = title;
    return data;
  }
}
