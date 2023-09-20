import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:expenses_tracker/model/expense.dart';

final formateddate = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.addExpense});
  void Function(Expense expense) addExpense;
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  _NewExpenseState();
  final titleController = TextEditingController();
  final amountcontroller = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    amountcontroller.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
  Category _selectedcategory = Category.leisure;

  void _presentDatepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitexpensedata() {
    final enteredamount = double.tryParse(amountcontroller.text);
    final invalidamount = enteredamount == null || enteredamount <= 0;
    if (titleController.text.trim().isEmpty ||
        invalidamount ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text(
              "Please make sure valid title , date and amount has been entered.."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("okay"),
            ),
          ],
        ),
      );
      return;
    }
    widget.addExpense(
      Expense(
          title: titleController.text,
          amount: enteredamount,
          date: _selectedDate!,
          category: _selectedcategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final keyboardspace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, Constraints) {
      final width = Constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 50, 16, keyboardspace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text("Expense Title"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: amountcontroller,
                          decoration: const InputDecoration(
                            prefixText: '\$',
                            label: Text("Amount"),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Expense Title"),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedcategory,
                          items: Category.values
                              .map(
                                (cataegory) => DropdownMenuItem(
                                  value: cataegory,
                                  child: Text(cataegory.name.toUpperCase()),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedcategory = value;
                            });
                          }),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? "No date selected"
                                  : formateddate.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _presentDatepicker,
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: amountcontroller,
                        decoration: const InputDecoration(
                          prefixText: '\$',
                          label: Text("Amount"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedDate == null
                                ? "No date selected"
                                : formateddate.format(_selectedDate!),
                          ),
                          IconButton(
                            onPressed: _presentDatepicker,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),
                  ]),
                const SizedBox(
                  height: 20,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _submitexpensedata,
                        child: Text("save"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedcategory,
                          items: Category.values
                              .map(
                                (cataegory) => DropdownMenuItem(
                                  value: cataegory,
                                  child: Text(cataegory.name.toUpperCase()),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedcategory = value;
                            });
                          }),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _submitexpensedata,
                        child: Text("save"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
