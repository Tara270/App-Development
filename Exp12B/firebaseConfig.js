// firebaseConfig.js
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";

const firebaseConfig = {
  apiKey: "AIzaSyDIu5rqmwTepTo_8PTnDVmrO0S_WL-1F-A",
  authDomain: "authapprn-b7d4f.firebaseapp.com",
  projectId: "authapprn-b7d4f",
  storageBucket: "authapprn-b7d4f.firebasestorage.app",
  messagingSenderId: "940772064035",
  appId: "1:940772064035:web:0951e3469413777bee2a96",
  measurementId: "G-JMT9JM0DF6"
};
const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export default app;