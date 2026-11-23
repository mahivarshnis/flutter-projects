# Tip Calculator – Flutter App

## Project Overview
A simple and interactive Tip Calculator built using Flutter and Dart. This application calculates the tip amount, total bill, and individual payment based on the number of people sharing the bill.

## Features
- **Bill Input:** Enter the total bill amount.
- **Tip Percentage:** Adjust the tip percentage using a slider (0%–30%).
- **People Counter:** Increase or decrease the number of people using plus and minus buttons.
- **Live Calculation:** Automatically updates results whenever the input changes.
- **Bill Splitting:** Calculates the amount each person needs to pay.
- **Safe Input Handling:** Uses `double.tryParse()` to handle invalid inputs.
- **Formatted Results:** Displays amounts up to two decimal places.

## Technologies Used
- Flutter
- Dart
- Material Design Widgets

## Flutter Concepts Practiced
- StatefulWidget and setState()
- TextField and user input handling
- Slider widget
- IconButton
- Dart getters
- Input validation using double.tryParse()
- Number formatting using toStringAsFixed()

## How It Works

The application uses the following formulas:

**Tip Amount**
```dart
bill * tipPercent / 100
```

**Total Amount**
```dart
bill + tip
```

**Amount Per Person**
```dart
total / people
```

## Sample Calculation

| Input | Value |
|---|---:|
| Bill Amount | ₹1000 |
| Tip Percentage | 10% |
| Number of People | 4 |
| Tip Amount | ₹100 |
| Total Bill | ₹1100 |
| Amount Per Person | ₹275.00 |

## How to Run
1. Open [DartPad](https://dartpad.dev/).
2. Select Flutter mode.
3. Copy the Dart source code into the editor.
4. Click Run to launch the application.
5. Enter a bill amount and adjust the tip percentage and number of people.

## Project Status
Completed – Project 02 (App Development).

## Learning Outcome
Learned how to build an interactive Flutter application, manage changing state, handle user input, perform calculations, and dynamically update the user interface.

---

**Developed as part of the InternCircle App Development Internship.**
