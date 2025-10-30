import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  double? _result;
  String _errorMessage = '';

  Future<void> _calculate(String operation) async {
    setState(() {
      _errorMessage = '';
    });

    double? num1 = double.tryParse(_controller1.text);
    double? num2 = double.tryParse(_controller2.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _errorMessage = 'Please enter valid numbers';
        _result = null;
      });
      return;
    }

    double? result;
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          setState(() {
            _errorMessage = 'Cannot divide by zero';
            _result = null;
          });
          return;
        } else {
          result = num1 / num2;
        }
        break;
    }

    setState(() {
      _result = result;
    });

    // ✅ Prepare data before sending
    final expression = '$num1 $operation $num2';
    final resultText = result?.toString() ?? 'null';

    print('📤 Sending to Firestore: {expression: $expression, result: $resultText}');

    try {
      await FirebaseFirestore.instance.collection('calculations').add({
        'expression': expression,
        'result': resultText,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('✅ Firestore insert successful!');
    } catch (e) {
      print('❌ Firestore insert failed: $e');
      setState(() {
        _errorMessage = 'Error saving to Firestore.';
      });
    }
  }

  void _clearAll() {
    setState(() {
      _controller1.clear();
      _controller2.clear();
      _result = null;
      _errorMessage = '';
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter first number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller2,
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearAll,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'AC',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            if (_result != null)
              Text(
                'Result: $_result',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
