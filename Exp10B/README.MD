Experiment 10B: To-Do List App using Firebase

Aim
To develop a simple To-Do List application in React Native using Firebase that allows users to add, complete, and delete tasks, with all tasks stored remotely in Firebase Firestore for real-time synchronization.

## Objective
To understand how to connect a React Native app with Firebase.
To perform CRUD operations (Create, Read, Update, Delete) using Firebase Firestore.
To store and sync tasks online instead of using local SQLite storage.
To build an interactive UI for managing tasks efficiently.

## Steps Followed
1. Created a New React Native Project

Opened terminal and ran:
npx create-expo-app TodoListFirebaseApp
cd TodoListFirebaseApp

--This created the base structure of the React Native app.

2. Installed Required Firebase Packages

Installed the Firebase SDK using:
npm install firebase

3. Set Up Firebase Console

Visited https://console.firebase.google.com

Clicked on Add Project → Entered Project Name → Created Project.
Added a Web App to the project and copied the Firebase Configuration.
Enabled Cloud Firestore Database from the Build → Firestore Database section.
Set security rules to Test Mode during development.

4. Configured Firebase in Project
Created a new file eg.firebaseConfig.js inside a folder named src.

Added the copied Firebase credentials:
import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "YOUR_API_KEY",
  authDomain: "YOUR_AUTH_DOMAIN",
  projectId: "YOUR_PROJECT_ID",
  storageBucket: "YOUR_STORAGE_BUCKET",
  messagingSenderId: "YOUR_SENDER_ID",
  appId: "YOUR_APP_ID"
};

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);

5. Created Firestore Functions

Added a new file db.js to handle all database operations:
addTask(task) → Adds a new task to Firestore.
getTasks() → Fetches all tasks in real time.
updateTask(id, done) → Marks a task as complete or incomplete.
deleteTask(id) → Removes a task from the Firestore collection.

6. Built the App UI

Used React Native components:
View, TextInput, TouchableOpacity, FlatList, and Text.
Designed a clean UI for adding tasks and displaying them in a list.
Added icons using @expo/vector-icons for better visuals.

7. Connected UI with Firebase

Used React Hooks (useState, useEffect) to manage task data.
Integrated Firestore functions to perform CRUD operations:
Add → Saves new task to Firebase.
Toggle Done → Updates “done” status in Firestore.*
Delete → Removes a document by ID.

Used Firestore’s onSnapshot() for real-time task updates.

8. Ran and Tested the App

Executed the app using:
npx expo start

Scanned the QR Code from Expo Go on the mobile device.

Verified that:
Tasks added were visible on all connected devices instantly.
Completed tasks were marked visually.
Deleted tasks disappeared in real time.

9. Checked Cloud Storage

Opened the Firebase Console → Firestore Database.
Confirmed that all task entries were being stored and updated correctly.

10. Final Verification

Ensured all CRUD operations worked properly.
Confirmed UI responsiveness and data synchronization.
Verified error handling (e.g., empty input validation).

## Result

A fully functional To-Do List App using Firebase Firestore was successfully developed and tested.
The app supports adding, updating, and deleting tasks with real-time online synchronization and persistent storage in the Firebase Cloud.