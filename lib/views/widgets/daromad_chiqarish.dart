import 'package:flutter/material.dart';
import 'package:imtixon_end/models/daromat.dart';


class Daromadlarlarsoni extends StatelessWidget {
  final Function() onEdit;
  final Function() onDelete;
  final Daromad expense;
  const Daromadlarlarsoni({
    super.key,
    required this.expense,
    required this.onEdit,
    required this.onDelete,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          expense.decctiroein,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("${expense.priec}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
