import 'package:flutter/material.dart';
import '../../models/harajat.dart';
import '../../utils/routes.dart';
import '../../view_models/harajatlar_viewmodel.dart';
import '../widgets/harajatlarimni_chiqarish.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final expensesViewModel = ExpensesViewmodel();
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = DateTime.now();
  }

  void addExpense() async {
    final response = await Navigator.pushNamed(
      context,
      RouteNames.harajatlar,
    );

    if (response != null) {
      await expensesViewModel.addExpense(
        (response as Map)['title'],
        double.parse(response['amount']),
        response['date'],
      );
      setState(() {});
    }
  }

  void editExpense(Harajat expense) async {
    final response = await Navigator.pushNamed(
      context,
      RouteNames.harajatlar,
      arguments: expense,
    );

    if (response != null) {
      await expensesViewModel.editExpense(
        expense.id,
        (response as Map)['title'],
        double.parse(response['amount']),
        response['date'],
      );
      setState(() {});
    }
  }

  void deleteExpense(Harajat expense) async {
    final response = await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Ishonchingiz komilmi?"),
          content: Text("Siz ${expense.decctiroein} xarajatini o'chirmoqchisiz."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Bekor qilish"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Ha, ishonchim komil"),
            ),
          ],
        );
      },
    );

    if (response) {
      await expensesViewModel.deleteExpense(expense.id);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daromadlar"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: addExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: expensesViewModel.list(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                final expenses = snapshot.data;
                return expenses == null || expenses.isEmpty
                    ? const Center(
                  child: Text("Xajaratlar mavjud emas."),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: expenses.length,
                  itemBuilder: (ctx, index) {
                    return Harajatlarsoni(
                      expense: expenses[index],
                      onEdit: () {
                        editExpense(expenses[index]);
                      },
                      onDelete: () {
                        deleteExpense(expenses[index]);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
