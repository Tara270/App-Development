# Experiment 3: Setting up Android Studio and create a simple counter app

##  Objective
To build a simple **Counter App** in Android Studio using **Java**, demonstrating basic UI components and event handling with buttons.

---

##  Steps Followed

### 1. **Setup Project**
- Open **Android Studio**.
- Create a new project → Select **Empty Activity**.
- Name the project `CounterApp`.

---

### 2. **Design the Layout (`activity_main.xml`)**
- Added a `TextView` to display the counter value (initially `0`).
- Added three buttons:
  - **Increase** → increments the counter.
  - **Decrease** → decrements the counter but does not go below 0.
  - **Reset** → resets the counter to 0.

---

### 3. **Implement Logic (`MainActivity.java`)**
- Linked UI elements (`TextView` and `Buttons`) using `findViewById()`.
- Added **Click Listeners** for buttons:
  - **Increase Button**: Gets current value, increments it by 1, and updates `TextView`.
  - **Decrease Button**: Gets current value, decrements it by 1 (only if > 0), and updates `TextView`.
  - **Reset Button**: Sets counter back to `0`.

---

## File: `MainActivity.java`
```java
public class MainActivity extends AppCompatActivity {
    private TextView Textview;
    private Button increaseBTN, decreaseBTN, resetBTN;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setUI();

        // Increase
        increaseBTN.setOnClickListener(v -> {
            String newText = Integer.toString(
                Integer.parseInt(Textview.getText().toString()) + 1
            );
            Textview.setText(newText);
        });

        // Decrease
        decreaseBTN.setOnClickListener(v -> {
            int current = Integer.parseInt(Textview.getText().toString());
            if (current != 0) {
                Textview.setText(Integer.toString(current - 1));
            }
        });

        // Reset
        resetBTN.setOnClickListener(v -> Textview.setText("0"));
    }

    private void setUI() {
        Textview = findViewById(R.id.textView2);
        increaseBTN = findViewById(R.id.button);
        decreaseBTN = findViewById(R.id.button2);
        resetBTN = findViewById(R.id.button3);
    }
}
