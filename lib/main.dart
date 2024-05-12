import 'package:app_1/models/item.dart';
import 'package:app_1/widget/cart_body.dart';
import 'package:app_1/widget/modal_bottom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyWiget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWiget extends StatefulWidget {
  MyWiget({super.key});

  @override
  State<MyWiget> createState() => _MyWigetState();
}

class _MyWigetState extends State<MyWiget> {
  final List<Item> listData = [];

  void _handleAddTask(String name) {
    final newTask = Item(id: DateTime.now().toString(), name: name);
    setState(() {
      listData.add(newTask);
    });
  }

  void _deleteTask(String id) {
    setState(() {
      listData.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo list",
            style: TextStyle(color: Colors.white, fontSize: 27)),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: listData
                .map((item) => cardBody(
                    index: listData.indexOf(item),
                    item: item,
                    handleDelete: _deleteTask))
                .toList(),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(0))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return modalBottom(addTask: _handleAddTask);
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
