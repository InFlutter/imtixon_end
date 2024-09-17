
import 'package:imtixon_end/service2/database2.dart';

import '../models/daromat.dart';


class ExpensesDatabase {
  final _localDatabase = LocalDatabase1();
  final _tableName = "expenses";

  Future<List<Daromad>> getExpenses(DateTime date) async {
    final previousDate = DateTime(date.year, date.month, 0);
    final nextDate = DateTime(date.year, date.month + 1, 1);
    final db = await _localDatabase.database;
    final rows = await db.query(
      _tableName,
      where: "date > '$previousDate' AND date < '$nextDate'",
    );
    List<Daromad> expenses = [];

    for (var row in rows) {
      expenses.add(
        Daromad.fromMap(row),
      );
    }

    return expenses;
  }

  Future<void> addExpense(Map<String, dynamic> expenseData) async {
    final db = await _localDatabase.database;
    await db.insert(_tableName, expenseData);
  }

  Future<void> editExpense(int id, Map<String, dynamic> expenseData) async {
    final db = await _localDatabase.database;
    await db.update(
      _tableName,
      expenseData,
      where: "id = $id",
    );
  }

  Future<void> deleteExpense(int id) async {
    final db = await _localDatabase.database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
