import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class Expenses_list extends StatelessWidget {
  const Expenses_list(
      {super.key, required this.expenses, required this.onRemove});
  final List<Expense> expenses;
  final Function(Expense expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
            background: Container(
              height: 10,
              // color: Color.fromARGB(255, 171, 169, 169).withOpacity(.2),
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),
            onDismissed: (direction) {
              onRemove(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: Expenseitem(expenses[index]),
          )),
    );
  }
}
