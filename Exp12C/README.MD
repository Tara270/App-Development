Experiment 12C: Firebase Authentication App using Android Studio

Aim
To develop an Android application in Android Studio integrated with Firebase Authenticationnthat allows users to sign up, sign in, and log out securely using Email/Password and optionally Google Sign-In methods. 

Key Features
- User registration with Email and Password  
- User login and logout functionality  
- Firebase Authentication integration  
- Google Sign-In option  
- Secure access to Home screen for authenticated users  

1. Project Setup
- Created a new Android Studio project (`Empty Activity` template).  
- Updated the **Gradle files** and set up project dependencies for:
  ```gradle
  implementation 'com.google.firebase:firebase-auth:22.3.0'
  implementation 'com.google.android.gms:play-services-auth:21.2.0'
Applied the Google Services plugin in the project-level build.gradle.

2. Firebase Console Setup
Created a new Firebase project in Firebase Console.
Added the Android app using its package name (e.g., com.example.authappas).
Downloaded and placed the google-services.json file inside the app/ folder.
Enabled the Email/Password, optionally Google, and Phone Authentication methods under
Build → Authentication → Sign-in method.
Added SHA-1 and SHA-256 keys for secure Google Sign-In.

3. Android Studio Configuration
Added google-services plugin at the bottom of the app/build.gradle file:
gradle
Copy code
apply plugin: 'com.google.gms.google-services'
Added Internet permission to the AndroidManifest.xml:

xml
Copy code
<uses-permission android:name="android.permission.INTERNET" />

4. UI Design
Created XML layouts for:
activity_sign_in.xml → Login form with Email, Password & Google button
activity_sign_up.xml → Registration form
activity_home.xml → Welcome screen for authenticated users
Designed buttons for Sign In, Sign Up, and Sign Out actions.

5. Implementation
MainActivity → Acts as app launcher and redirects user based on login state.
SignInActivity → Handles Email/Password and Google sign-in.
SignUpActivity → Registers new users and stores them in Firebase.
HomeActivity → Displays welcome message and logout option.
Firebase methods used:

java
Copy code
FirebaseAuth auth = FirebaseAuth.getInstance();
auth.createUserWithEmailAndPassword(email, password);
auth.signInWithEmailAndPassword(email, password);
auth.signOut();

6. Testing
Connected a virtual device (Emulator) / physical phone using USB debugging.
Built and ran the app using Run → Run ‘app’.
Tested user registration, login, logout, and Google Sign-In.
Verified registered users in Firebase Console → Authentication → Users.

## Expected Output
User can successfully register using email and password.
Registered users can log in and are redirected to Home screen.
Logged-in users can log out safely.
Google Sign-In works and authenticates users automatically.

## Conclusion

The Android application was successfully integrated with Firebase Authentication, enabling secure user login and registration using both Email/Password and Google Sign-In methods.