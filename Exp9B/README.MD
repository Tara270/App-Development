## Experiment 9 : To-Do List App using SQLite

Aim: To develop a simple To-Do List Application in React Native using Expo SQLite that allows users to add, complete, and delete tasks, with all tasks persisted locally in an SQLite database.

Objective:
Understand how to use React Native and Expo for mobile app development.
Learn how to store data locally using SQLite.
Implement basic CRUD operations (Create, Read, Update, Delete).
Design a clean and user-friendly UI using React Native components.

Theory:
SQLite is a lightweight, embedded database used for storing structured data locally within mobile applications.
In React Native, the expo-sqlite library provides an easy way to interact with SQLite databases — you can create tables, insert data, update or delete records, and query data.

A To-Do List App helps users manage daily tasks.
In this experiment, the app allows:
Adding a new task
Marking a task as completed/uncompleted
Deleting tasks
Storing all tasks persistently in a local SQLite database

## Steps Followed:
1) Created a New React Native Project using Expo

Opened terminal and ran:
npx create-expo-app TodoListApp
cd TodoListApp

--This created the basic structure of the React Native project.

2) Installed the Required SQLite Library

To use local database storage, installed Expo’s SQLite package:
npx expo install expo-sqlite

3) Created Folder Structure

Inside the project, made a new folder src and added a file db.js for database functions.

The structure looked like this:
TodoListApp/
├── App.js
└── src/
    └── db.js

4) Initialized SQLite Database

In db.js, opened the database and created a tasks table with columns:

id → Integer Primary Key
value → Text (task name)
done → Integer (0 for not done, 1 for done)

5) Wrote Database Functions

Added the following operations in db.js:
createTable() → Creates the tasks table if it doesn’t exist.
addTaskToDB(task) → Adds a new task to the database.
getAllTasks() → Fetches all tasks from the table.
deleteTaskFromDB(id) → Deletes a task by ID.
toggleDoneInDB(id, done) → Updates task completion status.

6) Designed the User Interface (UI)

Used React Native components like:
View, TextInput, TouchableOpacity, FlatList, Text
Created an input box to type a task and a button to add it.
Displayed tasks using FlatList in a scrollable list.

7) Linked UI with Database

Connected all database functions to the UI:
When user adds a task, it’s inserted into SQLite.
When user taps a task, it toggles completion.
When user long-presses a task, it gets deleted.
Used React hooks (useState, useEffect) to manage and reload data.

8) Tested the App using Expo Go

Run the project using:
npx expo start

Scanned the QR code using the Expo Go app on the mobile phone.
Verified that tasks were correctly added, updated, and deleted.


Final Verification
Ensured that the app’s layout was clean and responsive.
Verified that no errors appeared in the console or emulator.


Result:
The To-Do List app was successfully developed, tested, and executed using React Native with Expo and SQLite, providing local data storage and task management features.

