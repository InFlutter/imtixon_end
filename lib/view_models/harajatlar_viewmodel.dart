
import '../models/harajat.dart';
import '../services/xarajat_database.dart';

class ExpensesViewmodel {
  final _expensesDatabase = ExpensesDatabase();

  List<Harajat> _list = [];

  Future<List<Harajat>> list(DateTime date) async {
    _list = await _expensesDatabase.getExpenses(date);
    return [..._list];
  }

  Future<void> addExpense(String title, double amount, DateTime date) async {
    await _expensesDatabase.addExpense({
      "title": title,
      "amount": amount,
      "date": date.toString(),
    });
  }

  Future<void> editExpense(
    int id,
    String title,
    double amount,
    DateTime date,
  ) async {
    await _expensesDatabase.editExpense(
      id,
      {
        "title": title,
        "amount": amount,
        "date": date.toString(),
      },
    );
  }

  Future<void> deleteExpense(int id) async {
    await _expensesDatabase.deleteExpense(id);
  }
}
