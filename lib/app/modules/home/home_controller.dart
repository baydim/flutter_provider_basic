// use provider

import 'dart:developer';

import 'package:flut_prov/app/data/models/model_list_task.dart';
import 'package:flut_prov/app/data/services/service_shared.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  List<ModelListTask> _listTask = [];

  List<ModelListTask> get listTask => _listTask;

  funcOnAdd({required ModelListTask data}) async {
    _listTask.add(data);
    notifyListeners();
    // save data to shared preferences
    await ServiceShared.saveData(modelListTaskToJson(_listTask));
  }

  funcOnDelete({required String id}) async {
    _listTask.removeWhere((element) => element.id == id);
    notifyListeners();
    // save data to shared preferences
    await ServiceShared.saveData(modelListTaskToJson(_listTask));
  }

  funcOnInit() async {
    log("funcOnInit");
    // get data from shared preferences
    var data = await ServiceShared.getData();
    if (data != null) {
      _listTask = modelListTaskFromJson(data);
    } else {
      _listTask = [];
    }
    notifyListeners();
    // log _listTask length
    log(_listTask.length.toString());
  }
}
