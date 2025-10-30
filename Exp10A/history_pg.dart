import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  // Clear all calculations from Firestore
  Future<void> _clearAll(BuildContext context) async {
    final collection = FirebaseFirestore.instance.collection('calculations');
    final snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All history cleared!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.red),
            tooltip: 'Clear All (AC)',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Clear All History?'),
                  content: const Text(
                    'Are you sure you want to delete all saved calculations?',
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text('Clear'),
                      onPressed: () {
                        Navigator.pop(context);
                        _clearAll(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('calculations')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No calculations yet',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final calculations = snapshot.data!.docs;

          return RefreshIndicator(
            onRefresh: () async {}, // optional, Firestore auto-updates
            child: ListView.builder(
              itemCount: calculations.length,
              itemBuilder: (context, index) {
                final calc = calculations[index].data() as Map<String, dynamic>;
                final expression = calc['expression'] ?? '';
                final result = calc['result'] ?? '';

                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.calculate, color: Colors.blue),
                    title: Text(
                      expression,
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      '= $result',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
