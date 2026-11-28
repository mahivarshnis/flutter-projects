
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizPage(),
  ));
}

// Question model
class Question {
  final String text;
  final List<String> options;
  final int answerIndex;

  const Question(this.text, this.options, this.answerIndex);
}

// 10 quiz questions
const List<Question> questions = [
  Question('Which language is used in Flutter?',
      ['Java', 'Dart', 'Python', 'C++'], 1),

  Question('Everything in Flutter is a...',
      ['Widget', 'Class', 'Function', 'Variable'], 0),

  Question('Which widget is used for a scrollable list?',
      ['Column', 'Row', 'ListView', 'Stack'], 2),

  Question('Which widget is used for a button?',
      ['Text', 'ElevatedButton', 'Container', 'Image'], 1),

  Question('Which widget does not maintain state?',
      ['StatefulWidget', 'StatelessWidget', 'MaterialApp', 'Scaffold'], 1),

  Question('Which function builds the UI of a widget?',
      ['main()', 'runApp()', 'build()', 'setState()'], 2),

  Question('Which widget provides the basic app structure?',
      ['Scaffold', 'Text', 'Icon', 'Padding'], 0),

  Question('Which method updates the UI after a state change?',
      ['dispose()', 'setState()', 'createState()', 'initState()'], 1),

  Question('Which widget arranges children vertically?',
      ['Row', 'Stack', 'Column', 'Center'], 2),

  Question('Which file usually contains the main Dart code?',
      ['index.html', 'main.dart', 'style.css', 'pubspec.txt'], 1),
];

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int score = 0;
  int? selected;

  // Select an answer
  void chooseAnswer(int i) {
    if (selected != null) return;

    setState(() {
      selected = i;

      if (i == questions[index].answerIndex) {
        score++;
      }
    });
  }

  // Move to the next question
  void nextQuestion() {
    setState(() {
      index++;
      selected = null;
    });
  }

  // Restart the quiz
  void restartQuiz() {
    setState(() {
      index = 0;
      score = 0;
      selected = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Results screen
    if (index >= questions.length) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Results')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_events,
                  size: 80, color: Colors.orange),
              const SizedBox(height: 20),
              const Text(
                'Quiz Completed!',
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                'Your Score: $score / ${questions.length}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: restartQuiz,
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    // Current question
    final q = questions[index];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${index + 1} / ${questions.length}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress indicator
            LinearProgressIndicator(
              value: (index + 1) / questions.length,
            ),

            const SizedBox(height: 25),

            Text(
              q.text,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Four answer options
            for (int i = 0; i < q.options.length; i++)
              Card(
                color: selected == null
                    ? null
                    : i == q.answerIndex
                        ? Colors.green.shade100
                        : i == selected
                            ? Colors.red.shade100
                            : null,
                child: ListTile(
                  title: Text(q.options[i]),
                  onTap: selected == null
                      ? () => chooseAnswer(i)
                      : null,
                ),
              ),

            const SizedBox(height: 15),

            // Feedback and Next button
            if (selected != null) ...[
              Text(
                selected == q.answerIndex
                    ? 'Correct Answer!'
                    : 'Wrong Answer!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selected == q.answerIndex
                      ? Colors.green
                      : Colors.red,
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: nextQuestion,
                child: Text(
                  index == questions.length - 1
                      ? 'Show Results'
                      : 'Next',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
