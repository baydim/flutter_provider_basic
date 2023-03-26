import 'dart:math';

import 'package:flut_prov/app/data/models/model_list_task.dart';
import 'package:flut_prov/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in controller.listTask)
              ListTile(
                onTap: () {
                  controller.funcOnDelete(id: item.id);
                },
                title: Text(item.title),
                subtitle: Text(item.description),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.funcOnAdd(
            data: ModelListTask(
              id: Random().nextInt(100).toString(),
              title: "Title ${Random().nextInt(100)}",
              description: "description ${Random().nextInt(100)}",
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
