import 'package:flutter/material.dart';
import '../../models/harajat.dart';




class DaromadlarScreen extends StatefulWidget {
  const DaromadlarScreen({super.key});

  @override
  State<DaromadlarScreen> createState() => _DaromadlarScreenState();
}

class _DaromadlarScreenState extends State<DaromadlarScreen> {
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> expenseData = {};

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(context, expenseData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final expense = ModalRoute.of(context)!.settings.arguments as Harajat?;
    if (expense != null) {
      expenseData = {
        "title": expense.decctiroein,
        "amount": expense.priec,
        "date": expense.date,
      };
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          expense == null ? "Xarajat kiritish" : "Xajaratni tahrirlash",
        ),
        actions: [],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              initialValue: expenseData['title'],
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Xarajat nomi",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos xarajat nomini kiriting";
                }

                return null;
              },
              onSaved: (value) {
                expenseData['title'] = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: expenseData['amount']?.toString(),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Xarajat miqdori",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos xarajat miqdorini kiriting";
                }

                return null;
              },
              onSaved: (value) {
                expenseData['amount'] = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    final response = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );

                    if (response != null) {
                      expenseData['date'] = response;
                      setState(() {});
                    }
                  },
                  child: const Text("Kunni tanlash"),
                ),
              ],
            ),
            SizedBox(height: 70,),
            ElevatedButton(onPressed: submit,child: Icon(Icons.add),),
          ],
        ),
      ),
    );
  }
}




