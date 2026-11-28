# Project 04 – Unit Converter with Navigation

## 📌 Project Overview

The Unit Converter is a Flutter application developed using Dart. It allows users to convert different measurement units, including length, weight and temperature.

The application contains a home screen with three converter options. Each option opens a common, reusable converter screen where users can enter values, select units and view the converted results.

## 🎯 Objectives

- Learn screen navigation in Flutter.
- Understand how to pass data between screens.
- Implement dropdown menus for unit selection.
- Create reusable Flutter widgets.
- Write and test conversion functions.
- Handle invalid user input.

## ✨ Features

- **Home Screen:** Displays three conversion categories.
- **Length Converter:** Converts metres, kilometres, centimetres and miles.
- **Weight Converter:** Converts kilograms, grams and pounds.
- **Temperature Converter:** Converts Celsius and Fahrenheit.
- **Unit Selection:** Dropdown menus allow users to select source and target units.
- **Swap Units:** Switches the selected units.
- **Instant Conversion:** Displays results when a valid number is entered.
- **Input Validation:** Handles invalid numerical input.
- **Clear Option:** Clears the entered value.
- **Reusable Screen:** Uses a single converter screen for all three categories.

## 🛠️ Technologies Used

- Flutter
- Dart
- Material Design
- DartPad

## 📚 Concepts Implemented

1. StatelessWidget and StatefulWidget
2. Scaffold, AppBar, Card and ListTile
3. Navigator.push() and Navigator.pop()
4. MaterialPageRoute
5. Map data structures
6. DropdownButton
7. TextField and TextEditingController
8. setState()
9. Input validation using double.tryParse()
10. Conversion functions and assert() testing

## 🔄 Application Workflow

1. The application opens with the Home Screen.
2. The user selects Length, Weight or Temperature.
3. The selected converter configuration is passed to the reusable ConverterPage.
4. The user enters a numerical value.
5. The user selects the source and target units.
6. The application performs the conversion.
7. The converted result is displayed up to four decimal places.
8. The user can swap units, clear the input or return to the home screen.

## 🧮 Sample Conversions

| Conversion | Result |
|---|---:|
| 1 km to metres | 1000 |
| 1 mile to km | 1.609344 |
| 1 kg to grams | 1000 |
| 1 lb to kg | 0.45359237 |
| 100°C to °F | 212 |
| 32°F to °C | 0 |

## 🧪 Testing

The application includes assertion checks in the main function to verify the correctness of the conversion functions.

Test cases cover:
- Length conversion
- Weight conversion
- Celsius to Fahrenheit conversion

Invalid numerical inputs are also handled using `double.tryParse()`.

## ▶️ How to Run

1. Open [DartPad](https://dartpad.dev/).
2. Select Flutter.
3. Copy the complete Dart source code.
4. Paste it into the editor.
5. Click Run.
6. Test the three converter options.



---

*Developed as part of the InternCircle App Development learning program.*
