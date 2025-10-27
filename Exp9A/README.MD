Experiment No. 9 – Flutter Calculator using SQLite Database  

## Aim
To create a Flutter Calculator App that performs arithmetic operations and stores calculation history locally using SQLite.  
The app should allow the user to insert, retrieve, update, and delete past calculations.  
Each record must also include additional fields such as date and note for better tracking and personalization.

---

## Objectives
1. To understand the use of local databases in Flutter using SQLite.  
2. To design a calculator interface for performing basic arithmetic operations.  
3. To implement CRUD operations (Create, Read, Update, Delete) in SQLite.  
4. To associate each calculation with additional details like timestamp and custom note.  
5. To ensure persistent data storage even after app restarts.

---

## Theory
SQLite is a lightweight, serverless, self-contained database engine that stores data locally on the device.  
It is ideal for mobile applications that require persistent storage without needing internet access.

In Flutter, the SQLite database can be implemented using the packages:
- sqflite: Used for database operations such as create, read, update, and delete.
- path_provider: Used to find a valid path in the local file system for storing the database file.

SQLite allows an app to work completely offline while maintaining data persistence.

---

## Technologies Used
| Component | Description |
|------------|--------------|
| Flutter SDK (Dart) | Cross-platform UI framework |
| SQLite | Local database engine |
| sqflite | Flutter plugin for SQLite integration |
| path_provider | For accessing local device storage paths |

---

## Setup Instructions

Step 1: Create a new Flutter Project

Step 2: Add Dependencies
Open pubspec.yaml and add the following dependencies:
dependencies:
flutter:
sdk: flutter
sqflite: ^2.3.0
path_provider: ^2.1.1

Then run:
flutter pub get

Step 3: Create Project Files
Inside the lib folder, create:
lib/
├── main.dart
├── calculator_page.dart
├── history_page.dart
└── database_helper.dart

### Steps to Run the App

Connect your Android device or open an emulator.
Run the command:
flutter run

Perform basic calculations on the calculator screen.
Open the history page to view, update, or delete previous calculations.
Check that all CRUD operations (insert, retrieve, update, delete) are functioning correctly.

## Expected Output

Calculator Screen:
Numeric buttons and operators.
Display area for input and result.

History Screen:
List of previous calculations showing:
Expression
Result
Date and time
User note

### Functionalities:
Add new calculation to history.
Update note of a record.
Delete single or all records.
Persistent data even after app restart.

#### Advantages
Works fully offline using local database.
Ensures data persistence without requiring internet.
Demonstrates complete CRUD implementation.
Easy to modify or expand for additional features.

Conclusion
The experiment successfully demonstrates the integration of the SQLite database with a Flutter application.
