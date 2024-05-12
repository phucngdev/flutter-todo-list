import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class cardBody extends StatelessWidget {
  cardBody(
      {super.key,
      required this.item,
      required this.handleDelete,
      required this.index});

  var item;
  var index;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name,
                style: TextStyle(fontSize: 20, color: Colors.white)),
            InkWell(
                onTap: () async {
                  if (await confirm(context)) {
                    handleDelete(item.id);
                  }
                  return;
                },
                child: Icon(Icons.delete, size: 20, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
