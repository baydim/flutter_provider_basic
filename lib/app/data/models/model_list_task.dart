import 'dart:convert';

List<ModelListTask> modelListTaskFromJson(String str) =>
    List<ModelListTask>.from(
        json.decode(str).map((x) => ModelListTask.fromJson(x)));

String modelListTaskToJson(List<ModelListTask> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelListTask {
  final String id;
  final String title;
  final String description;

  ModelListTask({
    required this.id,
    required this.title,
    required this.description,
  });

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // from json
  factory ModelListTask.fromJson(Map<String, dynamic> json) {
    return ModelListTask(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
