import 'package:flutter/material.dart';
import 'database_helper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> _calculations = [];

  @override
  void initState() {
    super.initState();
    _loadCalculations();
  }

  Future<void> _loadCalculations() async {
    final data = await DatabaseHelper().getCalculations();
    setState(() {
      _calculations = data;
    });
  }

  Future<void> _refresh() async {
    await _loadCalculations();
  }

  Future<void> _clearAll() async {
    final db = await DatabaseHelper().database;
    await db.delete('calculations');
    await _loadCalculations();
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
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: _refresh,
          ),
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
                        _clearAll();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: _calculations.isEmpty
            ? const Center(
                child: Text(
                  'No calculations yet',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: _calculations.length,
                itemBuilder: (context, index) {
                  final calc = _calculations[index];
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
                        calc['expression'] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            '= ${calc['result'] ?? ''}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (calc['note'] != null && calc['note'].toString().isNotEmpty)
                            Text(
                              '📝 Note: ${calc['note']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          if (calc['date'] != null && calc['date'].toString().isNotEmpty)
                            Text(
                              '📅 ${calc['date']}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadCalculations();
  }
}
