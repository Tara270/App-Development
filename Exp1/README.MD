# Write a simple Program in JavaScript/TypeScript to perform CRUD on an array.

A simple JavaScript implementation demonstrating **CRUD** (Create, Read, Update, Delete) operations on an array.

---

## Features

- **Create:** Insert single or multiple elements into the array.
- **Read:** Display the current state of the array.
- **Update:** Modify an element at a specified index.
- **Delete:** Remove an element at a specified index.
- **Clear:** Reset the array to empty.

---

## Code Example

```javascript
let arr = [];

function create(value) {
    arr.push(value);
    console.log(`Inserted ${value}`);
}

function createBulk(values) {
    if (!Array.isArray(values)) {
        console.log("Input should be an array");
        return;
    }
    arr.push(...values);
    console.log(`Inserted ${values.length} items`);
}

function read() {
    console.log("Array:", arr);
}

function update(index, newValue) {
    if (index >= 0 && index < arr.length) {
        console.log(`Updated ${arr[index]} to ${newValue}`);
        arr[index] = newValue;
    } else {
        console.log("Invalid index");
    }
}

function remove(index) {
    if (index >= 0 && index < arr.length) {
        console.log(`Deleted ${arr[index]}`);
        arr.splice(index, 1);
    } else {
        console.log("Invalid index");
    }
}

function clear() {
    arr = [];
    console.log("Array cleared");
}
