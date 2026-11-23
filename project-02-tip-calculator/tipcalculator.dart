import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TipPage()));
}

class TipPage extends StatefulWidget {
  const TipPage({super.key});

  @override
  State<TipPage> createState() {
    return _TipPageState();
  }
}

class _TipPageState extends State<TipPage> {
  double bill = 0;
  double tipPercent = 10;
  int people = 1;

  double get tip => bill * tipPercent / 100;

  double get total => bill + tip;

  double get perPerson => total / people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tip Calculator")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Bill Amount",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  bill = double.tryParse(value) ?? 0;

                  if (bill < 0) {
                    bill = 0;
                  }
                });
              },
            ),

            const SizedBox(height: 25),

            Text(
              "Tip: ${tipPercent.round()}%",
              style: const TextStyle(fontSize: 18),
            ),

            Slider(
              value: tipPercent,
              min: 0,
              max: 30,
              divisions: 30,
              onChanged: (value) {
                setState(() {
                  tipPercent = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Text("People", style: TextStyle(fontSize: 18)),

                const Spacer(),

                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (people > 1) {
                        people--;
                      }
                    });
                  },
                ),

                Text(people.toString(), style: const TextStyle(fontSize: 18)),

                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      people++;
                    });
                  },
                ),
              ],
            ),
            const Divider(),

            Text("Tip: ₹${tip.toStringAsFixed(2)}"),

            Text("Total: ₹${total.toStringAsFixed(2)}"),

            Text(
              "Per person: ₹${perPerson.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
