import React, { useState, useEffect } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  FlatList,
  Keyboard,
  Alert
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import {
  createTable,
  addTaskToDB,
  getAllTasks,
  deleteTaskFromDB,
  toggleDoneInDB
} from './src/db';

export default function App() {
  const [task, setTask] = useState('');
  const [tasks, setTasks] = useState([]);

  // ✅ load tasks once after table creation
  useEffect(() => {
    (async () => {
      await createTable();
      await loadTasks();
    })();
  }, []);

  const loadTasks = async () => {
    await getAllTasks((data) => setTasks(data));
  };

  const addTask = async () => {
    if (task.trim().length === 0) {
      Alert.alert('Empty task', 'Please enter a task before adding.');
      return;
    }
    await addTaskToDB(task, loadTasks);
    setTask('');
    Keyboard.dismiss();
  };

  const toggleDone = async (id, done) => {
    await toggleDoneInDB(id, done, loadTasks);
  };

  const deleteTask = (id) => {
    Alert.alert('Delete Task', 'Are you sure you want to delete this task?', [
      { text: 'Cancel' },
      { text: 'Delete', style: 'destructive', onPress: async () => await deleteTaskFromDB(id, loadTasks) },
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
          name={item.done ? 'checkmark-circle' : 'ellipse-outline'}
          size={24}
          color={item.done ? '#4CAF50' : '#999'}
        />
        <Text style={[styles.taskText, item.done ? styles.doneText : null]}>
          {item.value}
        </Text>
      </View>
    </TouchableOpacity>
  );

  return (
    <View style={styles.container}>
      <Text style={styles.title}>🌈 My To-Do List</Text>

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
        keyExtractor={(item) => item.id.toString()}
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
    backgroundColor: '#E9F5FF',
    paddingTop: 60,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#0C4A6E',
    textAlign: 'center',
    marginBottom: 25,
  },
  inputContainer: {
    flexDirection: 'row',
    marginBottom: 20,
    backgroundColor: '#fff',
    borderRadius: 15,
    paddingHorizontal: 15,
    paddingVertical: 10,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 5,
    elevation: 3,
  },
  input: {
    flex: 1,
    fontSize: 16,
    color: '#333',
  },
  addButton: {
    backgroundColor: '#0C4A6E',
    borderRadius: 50,
    padding: 10,
    justifyContent: 'center',
    alignItems: 'center',
    marginLeft: 10,
  },
  taskContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#FFF',
    padding: 15,
    marginVertical: 5,
    borderRadius: 12,
    elevation: 2,
  },
  taskTextContainer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  taskText: {
    fontSize: 18,
    marginLeft: 10,
    color: '#333',
  },
  doneTask: {
    backgroundColor: '#C8E6C9',
  },
  doneText: {
    textDecorationLine: 'line-through',
    color: '#666',
  },
  emptyText: {
    textAlign: 'center',
    color: '#888',
    marginTop: 30,
    fontSize: 16,
  },
});