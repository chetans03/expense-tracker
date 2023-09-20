import 'package:expenses_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/widgets/expenses_list/theContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/expense.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpenses = [
    Expense(
        title: 'flutter course',
        amount: 20.88,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  String example = "FOR EXAMPLE";
  void openExpenseoverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        addExpense: addExpense,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
      example = "";
    });
  }

  void onRemove(Expense expense) {
    final expenseindex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 3,
        ),
        content: const Text("Expense removed"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                registeredExpenses.insert(expenseindex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget maincontent = Center(
      child: Text("No expense found .. Try to add some"),
    );
    if (registeredExpenses.isNotEmpty) {
      maincontent =
          Expenses_list(expenses: registeredExpenses, onRemove: onRemove);
    }
    return Scaffold(
      appBar: AppBar(title: const Text('EXPENSE TRACKER'), actions: [
        IconButton(onPressed: openExpenseoverlay, icon: const Icon(Icons.add)),
      ]),
      body: width < 600
          ? Column(
              children: [
                const theContainer(),
                registeredExpenses.isNotEmpty
                    ? Text(
                        example,
                        style: GoogleFonts.poppins(),
                      )
                    : Text(""),
                Expanded(child: maincontent),
              ],
            )
          : Row(
              children: [
                Expanded(child: theContainer()),
                Expanded(child: maincontent),
              ],
            ),
    );
  }
}
