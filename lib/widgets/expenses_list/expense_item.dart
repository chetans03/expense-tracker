import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$${expense.amount.toStringAsFixed(2)}',
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(Categoryicon[expense.category]),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        expense.dateformatted,
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
