import 'package:flutter/material.dart';

class modalBottom extends StatelessWidget {
  modalBottom({super.key, required this.addTask});

  final Function(String) addTask;

  TextEditingController controller = TextEditingController();

  void handleOnclick(BuildContext context) {
    if (controller.text.isEmpty) {
      return;
    }
    addTask(controller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Your task"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => handleOnclick(context),
                child: const Text("Add task")),
          ]),
        ),
      ),
    );
  }
}
