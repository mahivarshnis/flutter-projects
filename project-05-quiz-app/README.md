# Project 05 – Quiz App

## 📌 Project Overview

The Quiz App is a Flutter application developed using Dart. It contains 10 multiple-choice questions based on Flutter and Dart fundamentals.

Users can select answers, receive instant feedback, track their progress and view their final score after completing the quiz. The application also provides an option to restart the quiz.

## 🎯 Objectives

- Understand StatefulWidget and state management.
- Learn how to store and display questions using a list.
- Track the current question and score.
- Display feedback based on selected answers.
- Create a results screen.
- Learn how to reset application state.

## ✨ Features

- 10 multiple-choice questions.
- Four options for every question.
- Instant correct and incorrect answer feedback.
- Green colour for correct answers.
- Red colour for incorrect selections.
- Progress indicator to track quiz completion.
- Next button to move between questions.
- Score calculation.
- Results screen displaying the final score.
- Try Again button to restart the quiz.

## 🛠️ Technologies Used

- Flutter
- Dart
- Material Design
- DartPad

## 📚 Concepts Implemented

1. Classes and objects
2. StatefulWidget
3. setState()
4. Lists and data modelling
5. Conditional statements
6. ListTile and Card widgets
7. LinearProgressIndicator
8. User input handling
9. State resetting

## 🔄 Application Workflow

1. The application displays the first question.
2. The user selects one of the four options.
3. The application checks the selected answer.
4. Correct answers are highlighted in green and incorrect selections in red.
5. The score is updated for correct answers.
6. The user clicks Next to continue.
7. After all 10 questions, the results screen displays the final score.
8. The user can select Try Again to restart the quiz.

## 🧪 Testing

The application should be tested using the following cases:

| Test Case | Expected Result |
|---|---|
| Select a correct answer | Correct feedback and score increases |
| Select a wrong answer | Wrong feedback and score remains unchanged |
| Tap another option after answering | Further selection is disabled |
| Complete all questions | Results screen appears |
| Select Try Again | Quiz restarts with score 0 |

## ▶️ How to Run

1. Open [DartPad](https://dartpad.dev/).
2. Select Flutter.
3. Copy the complete Dart code.
4. Paste it into the editor.
5. Click Run.
6. Answer the questions and test the quiz.

