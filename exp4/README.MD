# Experiment 4: Setting up Flutter SDK and create calculator app.(upload a folder add all the main code files and add Readme and output png file)

## Objective

To create a basic calculator in Flutter that can perform addition, subtraction, multiplication, and division between two numbers, while handling invalid inputs and division by zero.

## Prerequisites

* Flutter SDK installed on your system.
* A code editor such as **VS Code** or **Android Studio**.
* Basic knowledge of Dart and Flutter widgets.

## Steps Followed

### 1. Project Setup

1. Open your terminal/command prompt.
2. Create a new Flutter project:

   ```bash
   flutter create simple_calculator
   ```
3. Navigate to the project folder:

   ```bash
   cd simple_calculator
   ```
4. Open the project in your preferred editor.

### 2. Creating Main Dart File

1. Replace the contents of `lib/main.dart` with the provided code.
2. Structure of the app:

   * **StatelessWidget** `CalculatorApp` → Sets up MaterialApp with a title and theme.
   * **StatefulWidget** `CalculatorHomePage` → Contains the logic and UI for calculations.

### 3. UI Design

* Two `TextField` widgets to input numbers.
* Four `ElevatedButton` widgets for operations: `+`, `-`, `*`, `/`.
* `Text` widget to display **result** or **error message**.

### 4. Handling User Input

* `TextEditingController` used for reading inputs from the text fields.
* Input validation:

  * Ensures the input is numeric using `double.tryParse()`.
  * Displays an error message if input is invalid.
  * Checks for division by zero in the division operation.

### 5. Calculation Logic

* `_calculate(String operation)` method:

  * Parses user input.
  * Performs arithmetic based on the button pressed.
  * Updates the `_result` or `_errorMessage` state to show in the UI.

### 6. Running the App

1. Connect a device/emulator.
2. Run the project:

   ```bash
   flutter run
   ```
3. The app should launch with two input fields, four operation buttons, and an area to display results.

## Expected Outcome

1. User enters two numbers.
2. User clicks one of the operation buttons.
3. App displays:

   * **Result** of the operation if inputs are valid.
   * **Error message** if inputs are invalid or division by zero occurs.
4. Example:

   * Input: `10` and `2`, Operation: `/` → Output: `Result: 5.0`
   * Input: `abc` and `2`, Operation: `+` → Output: `Please enter valid numbers`
   * Input: `5` and `0`, Operation: `/` → Output: `Cannot divide by zero`

## Features Implemented

* Addition, Subtraction, Multiplication, Division.
* Input validation for numbers.
* Division by zero handling.
* Clear error messages.
* Responsive and simple UI.

## Notes

* The app is a basic Flutter experiment suitable for beginners.
* Further improvements:

  * Add a clear/reset button.
  * Support for more advanced calculations (like percentages, exponents).
  * Improve UI aesthetics with themes and styling.
