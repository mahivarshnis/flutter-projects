# To-Do List App – Flutter

## Project Overview

The To-Do List App is a simple task management application developed using Flutter and Dart. It allows users to add new tasks, mark tasks as completed, and delete tasks when they are no longer needed.

The application uses Flutter's state management features to update the task list dynamically whenever the user performs an action.

## Features

- **Add Tasks:** Enter new tasks using a text field and Add button.
- **Display Tasks:** View all added tasks in a scrollable list.
- **Complete Tasks:** Mark tasks as completed using checkboxes.
- **Delete Tasks:** Swipe left or right on a task to remove it.
- **Task Counter:** Displays the number of remaining incomplete tasks.
- **Empty State:** Shows a message when there are no tasks.
- **Input Validation:** Prevents empty or whitespace-only tasks from being added.
- **Live Updates:** Automatically refreshes the interface whenever the task list changes.

## Technologies Used

- Flutter
- Dart
- Material Design

## Flutter Concepts Practiced

- StatefulWidget and setState()
- Classes and Objects
- Dart Lists and Collections
- TextEditingController
- ListView.builder
- CheckboxListTile
- Dismissible Widget
- ObjectKey for unique list items
- Input validation
- Widget lifecycle and dispose()

## How It Works

1. The user enters a task in the text field.
2. The Add button creates a new Todo object.
3. The task is added to the list and displayed on the screen.
4. Users can mark tasks as completed using checkboxes.
5. Completed tasks are displayed with a strikethrough effect.
6. Users can swipe a task to delete it.
7. The remaining task counter updates automatically.

## Application Structure

The application consists of:

- **Todo Class:** Stores the task title and completion status.
- **TodoPage:** Main StatefulWidget responsible for the application screen.
- **TodoPageState:** Manages the task list, user input and UI updates.

## How to Run

1. Open [DartPad](https://dartpad.dev/).
2. Select Flutter mode.
3. Copy the project source code into the editor.
4. Click Run to launch the application.
5. Add tasks and test the available features.

## Testing

The following test cases were performed:

| Test Case | Expected Result |
|---|---|
