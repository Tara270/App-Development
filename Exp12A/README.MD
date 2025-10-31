Experiment 12A: Firebase Authentication App using Flutter

Aim
To implement user authentication with Firebase.
Build a Login and Signup form in a Flutter mobile app using Firebase Authentication (Email/Password).
Optionally integrate Google Sign-In or Phone Number authentication.
The app should persist user session state and show a protected dashboard only after successful sign-in.

Steps Followed

1] Create Flutter Project

Open VS Code or Android Studio.
Run the command:
flutter create firebase_auth_app

Open the created project folder.

2] Add Firebase to Flutter Project

Go to Firebase Console
Create a new Firebase project.
Add an Android app (using your package name).
Download the google-services.json file and place it in android/app/.
Enable Email/Password Authentication under Firebase → Authentication → Sign-in method.
Copy and add the Firebase config code in your Flutter project’s main.dart.

3] Add Dependencies in pubspec.yaml

dependencies:
  firebase_core: ^latest
  firebase_auth: ^latest
  google_sign_in: ^latest

5] Initialize Firebase

In main.dart, initialize Firebase before running the app:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

6] Design Login and Signup UI

Create login_screen.dart and signup_screen.dart for authentication forms.
Add TextFields for email and password input.
Add buttons for Sign Up, Login, and optionally Sign in with Google.

7] Implement Authentication Logic

Use FirebaseAuth methods:
// Sign Up
await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

// Login
await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

// Logout
await FirebaseAuth.instance.signOut();

8] Session Persistence

Use FirebaseAuth’s authStateChanges() to check login state and navigate between Login and Dashboard screens automatically.

9] Create Protected Dashboard Screen

Allow access to this screen only when the user is logged in.
Show user email and a Logout button.

10] (Optional) Google Sign-In Integration

Configure Google Sign-In in Firebase.
Use the google_sign_in package for authentication.

Expected Output

A working Flutter app with:
Login and Signup screens.
Firebase Email/Password authentication.
Session persistence (user stays logged in after reopening app).
Protected Dashboard visible only to authenticated users.
Optionally, Google Sign-In functionality.

Result

Successfully developed a Flutter app integrated with Firebase Authentication to perform user sign-up, login, and logout, and manage session states securely.