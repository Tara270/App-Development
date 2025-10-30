Experiment 10A: Firebase Calculator App using Flutter

Aim:
To develop a Flutter calculator app that performs basic arithmetic operations and stores/retrieves calculation history using Firebase Firestore, enabling users to access their previous calculations across devices.

Software Requirements
Flutter SDK
Android Studio / VS Code
Dart SDK
Firebase Console account
Firebase Firestore Database

Hardware Requirements
Android mobile phone or emulator
Computer/Laptop with internet connection

Theory:
Firebase is a backend platform provided by Google that helps developers build and manage mobile and web applications.
In this experiment, Firebase Firestore is used to store and retrieve calculator history.
Flutter, a cross-platform UI toolkit, allows building a responsive calculator interface using Dart programming language.
The app performs basic arithmetic operations like addition, subtraction, multiplication, and division.
Each calculation is stored in Firestore, allowing users to view their previous calculations even after closing the app.

## Procedure

1] Create a new Flutter project using the command:

flutter create firebase_calculator_app

2] Set up Firebase project in the Firebase Console:
Create a new project named firebase_calculator_app.
Add an Android app and download the google-services.json file.
Place it inside the android/app folder of your Flutter project.

3] Add dependencies in pubspec.yaml:

dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^latest_version
  cloud_firestore: ^latest_version

4] Initialize Firebase in main.dart:
await Firebase.initializeApp();


5] Design UI for calculator using widgets like:

TextField for displaying input/output.
GridView or Table for calculator buttons.
ElevatedButton for operations (+, −, ×, ÷, =).

6] Implement calculator logic to perform basic operations.

7] Connect to Firebase Firestore:

Create a collection named history.
Store each calculation result using:

FirebaseFirestore.instance.collection('history').add({
  'expression': '5 + 3',
  'result': '8',
  'timestamp': FieldValue.serverTimestamp(),
});
Retrieve and display history using a StreamBuilder.

8] Run the app on an emulator or physical device:
flutter run

## Expected Output
The app should open with a functional calculator interface.
Users can perform arithmetic operations such as:
Addition
Subtraction
Multiplication
Division

Each calculation performed is automatically saved in Firebase Firestore.
The calculation history is displayed on the screen or a separate tab.
On reopening the app, users can view all their past calculations retrieved from Firebase.

## Result

A Flutter-based calculator app was successfully developed that performs arithmetic operations and stores calculation history in Firebase Firestore, enabling persistent data access across devices.