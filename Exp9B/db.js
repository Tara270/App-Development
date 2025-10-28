import * as SQLite from 'expo-sqlite';

let db;

// ✅ Initialize database once
async function initDB() {
  if (!db) {
    db = await SQLite.openDatabaseAsync('tasks.db');
    console.log('📂 Database opened');
  }
  return db;
}

// ✅ Create table
export async function createTable() {
  const db = await initDB();
  await db.execAsync(`
    CREATE TABLE IF NOT EXISTS tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      value TEXT,
      done INTEGER DEFAULT 0
    );
  `);
  console.log('✅ Table ready (with done column)');
}

// ✅ Add new task
export async function addTaskToDB(value, onSuccess) {
  try {
    const db = await initDB();
    await db.runAsync('INSERT INTO tasks (value, done) VALUES (?, 0);', [value]);
    console.log('✅ Task added');
    onSuccess?.();
  } catch (error) {
    console.log('❌ Insert error', error);
  }
}

// ✅ Get all tasks
export async function getAllTasks(onSuccess) {
  try {
    const db = await initDB();
    const result = await db.getAllAsync('SELECT * FROM tasks ORDER BY id DESC;');
    onSuccess?.(result);
  } catch (error) {
    console.log('❌ Select error', error);
  }
}

// ✅ Delete task
export async function deleteTaskFromDB(id, onSuccess) {
  try {
    const db = await initDB();
    await db.runAsync('DELETE FROM tasks WHERE id = ?;', [id]);
    console.log('🗑 Task deleted');
    onSuccess?.();
  } catch (error) {
    console.log('❌ Delete error', error);
  }
}

// ✅ Toggle done/undone
export async function toggleDoneInDB(id, currentStatus, onSuccess) {
  try {
    const db = await initDB();
    const newStatus = currentStatus === 1 ? 0 : 1;
    await db.runAsync('UPDATE tasks SET done = ? WHERE id = ?;', [newStatus, id]);
    console.log('✅ Task status toggled');
    onSuccess?.();
  } catch (error) {
    console.log('❌ Toggle error', error);
  }
}