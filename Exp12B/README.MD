# Experiment 12B: Firebase Authentication App using React Native

## Aim
To develop a **React Native mobile app** integrated with **Firebase Authentication** to perform user sign-up, login, and logout operations securely.

---

## Software and Hardware Requirements
### Software:
- React Native (Expo or React Native CLI)
- Firebase Console (Authentication module)
- Node.js and npm
- Visual Studio Code
- Android Studio or physical mobile device for testing

### Hardware:
- Windows/Linux/Mac system
- Android or iOS smartphone

---

## Theory
Firebase Authentication provides backend services, easy-to-use SDKs, and ready-made UI libraries to authenticate users in mobile and web applications. It supports multiple authentication methods like Email/Password, Google, Facebook, and others.  
React Native allows developers to build native mobile apps using JavaScript and React, enabling cross-platform compatibility.

---

## Steps Followed
1. **Project Setup**
   - Installed React Native environment using Expo CLI:
     ```bash
     npx create-expo-app firebase-auth-app
     ```
   - Installed required dependencies:
     ```bash
     npm install firebase
     ```

2. **Firebase Configuration**
   - Created a new project in Firebase Console.
   - Enabled **Email/Password Authentication** under the Authentication section.
   - Obtained Firebase config object and added it in the project file (`firebaseConfig.js`).

3. **App Implementation**
   - Created three screens:  
     - **SignUpScreen.js** – for new user registration  
     - **LoginScreen.js** – for existing users  
     - **HomeScreen.js** – to display user session and logout option  

4. **Navigation Setup**
   - Implemented navigation between login, signup, and home using `@react-navigation/native`.

5. **Authentication Functions**
   - Used Firebase methods:
     ```javascript
     createUserWithEmailAndPassword()
     signInWithEmailAndPassword()
     signOut()
     ```
   - Managed session persistence with Firebase’s authentication state observer.

6. **Testing**
   - Deployed app on Expo Go / emulator.
   - Verified registration, login, and logout functionality.

---

## Output
- User can register with email and password.
- User can log in using valid credentials.
- Logout functionality clears the session and redirects to the login screen.

---

## Result
Successfully developed a **React Native app integrated with Firebase Authentication** to perform user sign-up, login, and logout, and manage session states securely.
