# Experiment 2: Write a Simple Dart Program for Input/Output and Loops

# Aim
To write a simple Dart program that demonstrates **taking input/output** and using different types of **loops**.

---

## 📜 Problem Statement
Create a Dart program that:
1. Takes a user’s name as input (default = "Guest" if no input given).  
2. Takes a number as input with error handling.  
3. Prints the entered name and number.  
4. Demonstrates:
   - A `for` loop (from 1 to the number entered).  
   - A `while` loop (countdown from the number entered to 1).  
   - A `do-while` loop (runs at least once).  

---

## 🖥️ Source Code
```dart
import 'dart:io';

void main() {
  // Taking input for name
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    name = "Guest"; // default name if input is empty
  }

  // Taking input for number with error handling
  int? num;
  while (num == null) {
    stdout.write("Enter a number: ");
    String? input = stdin.readLineSync();
    if (input != null) {
      try {
        num = int.parse(input);
      } catch (e) {
        print("Please enter a valid integer.");
      }
    }
  }

  // Output
  print("\nHello, $name!");
  print("You entered: $num");

  // For loop
  print("\nFor loop from 1 to $num:");
  for (int i = 1; i <= num; i++) {
    print("i = $i");
  }

  // While loop
  print("\nWhile loop countdown:");
  int count = num;
  while (count > 0) {
    print(count);
    count--;
  }

  // Do-while loop
  print("\nDo-while loop runs at least once:");
  int x = 0;
  do {
    print("x = $x");
    x++;
  } while (x < 3);
}

