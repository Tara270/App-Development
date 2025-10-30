import React, { useState, useEffect } from "react";
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  FlatList,
  Keyboard,
  Alert,
} from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { db } from "./src/firebaseConfig";
import {
  collection,
  addDoc,
  deleteDoc,
  doc,
  updateDoc,
  query,
  orderBy,
  onSnapshot,
  serverTimestamp,
} from "firebase/firestore";

export default function App() {
  const [task, setTask] = useState("");
  const [tasks, setTasks] = useState([]);

  // ✅ Real-time listener
  useEffect(() => {
    const q = query(collection(db, "tasks"), orderBy("createdAt", "desc"));
    const unsubscribe = onSnapshot(q, (querySnapshot) => {
      const list = [];
      querySnapshot.forEach((doc) => {
        list.push({ id: doc.id, ...doc.data() });
      });
      setTasks(list);
    });

    // Cleanup on unmount
    return () => unsubscribe();
  }, []);

  const addTask = async () => {
    if (task.trim().length === 0) {
      Alert.alert("Empty Task", "Please enter a task before adding.");
      return;
    }

    try {
      await addDoc(collection(db, "tasks"), {
        value: task.trim(),
        done: false,
        createdAt: serverTimestamp(),
      });
      setTask("");
      Keyboard.dismiss();
    } catch (error) {
      console.error("❌ Error adding task:", error);
    }
  };

  const toggleDone = async (id, done) => {
    try {
      await updateDoc(doc(db, "tasks", id), { done: !done });
    } catch (error) {
      console.error("❌ Error updating task:", error);
    }
  };

  const deleteTask = (id) => {
    Alert.alert("Delete Task", "Are you sure you want to delete this task?", [
      { text: "Cancel" },
      {
        text: "Delete",
        style: "destructive",
        onPress: async () => {
          try {
            await deleteDoc(doc(db, "tasks", id));
          } catch (error) {
            console.error("❌ Error deleting task:", error);
          }
        },
      },
    ]);
  };

  const renderItem = ({ item }) => (
    <TouchableOpacity
      style={[styles.taskContainer, item.done ? styles.doneTask : null]}
      onPress={() => toggleDone(item.id, item.done)}
      onLongPress={() => deleteTask(item.id)}
    >
      <View style={styles.taskTextContainer}>
        <Ionicons
          name={item.done ? "checkmark-circle" : "ellipse-outline"}
          size={24}
          color={item.done ? "#4CAF50" : "#999"}
        />
        <Text style={[styles.taskText, item.done ? styles.doneText : null]}>
          {item.value}
        </Text>
      </View>
    </TouchableOpacity>
  );

  return (
    <View style={styles.container}>
      <Text style={styles.title}>🌈 My Firebase To-Do List</Text>

      <View style={styles.inputContainer}>
        <TextInput
          style={styles.input}
          placeholder="Enter your task..."
          value={task}
          onChangeText={setTask}
          placeholderTextColor="#aaa"
        />
        <TouchableOpacity style={styles.addButton} onPress={addTask}>
          <Ionicons name="add" size={28} color="white" />
        </TouchableOpacity>
      </View>

      <FlatList
        data={tasks}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
        ListEmptyComponent={
          <Text style={styles.emptyText}>No tasks yet. Add one!</Text>
        }
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: "#E9F5FF",
    paddingTop: 60,
  },
  title: {
    fontSize: 28,
    fontWeight: "bold",
    color: "#0C4A6E",
    textAlign: "center",
    marginBottom: 25,
  },
  inputContainer: {
    flexDirection: "row",
    marginBottom: 20,
    backgroundColor: "#fff",
    borderRadius: 15,
    paddingHorizontal: 15,
    paddingVertical: 10,
    shadowColor: "#000",
    shadowOpacity: 0.1,
    shadowRadius: 5,
    elevation: 3,
  },
  input: {
    flex: 1,
    fontSize: 16,
    color: "#333",
  },
  addButton: {
    backgroundColor: "#0C4A6E",
    borderRadius: 50,
    padding: 10,
    justifyContent: "center",
    alignItems: "center",
    marginLeft: 10,
  },
  taskContainer: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: "#FFF",
    padding: 15,
    marginVertical: 5,
    borderRadius: 12,
    elevation: 2,
  },
  taskTextContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  taskText: {
    fontSize: 18,
    marginLeft: 10,
    color: "#333",
  },
  doneTask: {
    backgroundColor: "#C8E6C9",
  },
  doneText: {
    textDecorationLine: "line-through",
    color: "#666",
  },
  emptyText: {
    textAlign: "center",
    color: "#888",
    marginTop: 30,
    fontSize: 16,
  },
});
56