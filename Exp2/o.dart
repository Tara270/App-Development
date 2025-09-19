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
