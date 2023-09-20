import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class theContainer extends StatelessWidget {
  const theContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
        height: 200,
        width: 400,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              "Now track your expenses anytime real quick... ",
              style: GoogleFonts.acme(
                  fontSize: 20, color: Color.fromARGB(110, 255, 233, 198)),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.flight,
                    size: 30,
                    color: Color.fromARGB(255, 156, 110, 110),
                  ),
                  Icon(
                    Icons.dining,
                    size: 30,
                    color: Color.fromARGB(255, 156, 110, 110),
                  ),
                  Icon(
                    Icons.movie,
                    size: 30,
                    color: Color.fromARGB(255, 156, 110, 110),
                  ),
                  Icon(
                    Icons.work,
                    size: 30,
                    color: Color.fromARGB(255, 156, 110, 110),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Click on + to addd Expense",
              style: GoogleFonts.lato(fontSize: 15),
            ),
          ]),
        ),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
