import 'package:flutter/material.dart';

// 1. Unit conversion data
const lengthUnits = {
  'Metre (m)': 1.0,
  'Kilometre (km)': 1000.0,
  'Centimetre (cm)': 0.01,
  'Mile': 1609.344,
};

const weightUnits = {
  'Kilogram (kg)': 1.0,
  'Gram (g)': 0.001,
  'Pound (lb)': 0.45359237,
};

const temperatureUnits = {'Celsius (°C)': 1.0, 'Fahrenheit (°F)': 1.0};

// 2. Conversion function
double convert(
  double value,
  String from,
  String to,
  Map<String, double> units, {
  bool temperature = false,
}) {
  if (temperature) {
    double celsius = from == 'Celsius (°C)' ? value : (value - 32) * 5 / 9;

    return to == 'Celsius (°C)' ? celsius : celsius * 9 / 5 + 32;
  }

  double base = value * units[from]!;
  return base / units[to]!;
}

// 3. Main function and tests
void main() {
  assert(
    (convert(1, 'Kilometre (km)', 'Metre (m)', lengthUnits) - 1000).abs() <
        0.0001,
  );

  assert(
    (convert(1, 'Kilogram (kg)', 'Gram (g)', weightUnits) - 1000).abs() <
        0.0001,
  );

  assert(
    (convert(
                  100,
                  'Celsius (°C)',
                  'Fahrenheit (°F)',
                  temperatureUnits,
                  temperature: true,
                ) -
                212)
            .abs() <
        0.0001,
  );

  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
  );
}

// 4. Home screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final converters = [
      ['Length Converter', lengthUnits, Icons.straighten, false],
      ['Weight Converter', weightUnits, Icons.scale, false],
      ['Temperature Converter', temperatureUnits, Icons.thermostat, true],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Choose a Converter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          ...converters.map((item) {
            return Card(
              child: ListTile(
                leading: Icon(
                  item[2] as IconData,
                  color: Colors.teal,
                  size: 35,
                ),

                title: Text(item[0] as String),

                trailing: const Icon(Icons.chevron_right),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConverterPage(
                        title: item[0] as String,
                        units: item[1] as Map<String, double>,
                        temperature: item[3] as bool,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

// 5. Reusable converter screen
class ConverterPage extends StatefulWidget {
  final String title;
  final Map<String, double> units;
  final bool temperature;

  const ConverterPage({
    super.key,
    required this.title,
    required this.units,
    required this.temperature,
  });

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final controller = TextEditingController();

  late String from;
  late String to;

  @override
  void initState() {
    super.initState();

    from = widget.units.keys.first;
    to = widget.units.keys.elementAt(1);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? result;
    final value = double.tryParse(controller.text.trim());

    if (value != null) {
      result = convert(
        value,
        from,
        to,
        widget.units,
        temperature: widget.temperature,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Text('Enter Value', style: TextStyle(fontSize: 18)),

            const SizedBox(height: 10),

            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),

            const SizedBox(height: 20),

            const Text('From Unit'),

            DropdownButton<String>(
              value: from,
              isExpanded: true,
              items: widget.units.keys.map((unit) {
                return DropdownMenuItem(value: unit, child: Text(unit));
              }).toList(),

              onChanged: (value) {
                setState(() {
                  from = value!;
                });
              },
            ),

            Center(
              child: IconButton(
                icon: const Icon(Icons.swap_vert, size: 35, color: Colors.teal),
                onPressed: () {
                  setState(() {
                    final temp = from;
                    from = to;
                    to = temp;
                  });
                },
              ),
            ),

            const Text('To Unit'),

            DropdownButton<String>(
              value: to,
              isExpanded: true,
              items: widget.units.keys.map((unit) {
                return DropdownMenuItem(value: unit, child: Text(unit));
              }).toList(),

              onChanged: (value) {
                setState(() {
                  to = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            const Text(
              'Result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              controller.text.isEmpty
                  ? 'Enter a value'
                  : result == null
                  ? 'Please enter a valid number'
                  : '${result.toStringAsFixed(4)} $to',
              style: TextStyle(
                fontSize: 22,
                color: result == null ? Colors.red : Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.clear();
                });
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
