// firebaseConfig.js
import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyCT0RvK_pW32JG41JiqsS1SG-UoecR2vhY",
  authDomain: "todo-list-app-a1384.firebaseapp.com",
  projectId: "todo-list-app-a1384",
  storageBucket: "todo-list-app-a1384.firebasestorage.com",
  messagingSenderId: "555960354709",
  appId: "1:555960354709:web:5175b9fe8b77c7d201989c"
};

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
