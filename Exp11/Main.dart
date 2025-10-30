import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/quote_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuoteViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivational Quotes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuoteScreen(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuoteViewModel>().loadQuotes();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<QuoteViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Motivational Quotes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => vm.loadQuotes(),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.errorMessage != null) {
            return Center(child: Text('Error: ${vm.errorMessage}'));
          }

          if (vm.quotes.isEmpty) {
            return const Center(child: Text('No quotes found.'));
          }

          return ListView.builder(
            itemCount: vm.quotes.length,
            itemBuilder: (context, index) {
              final quote = vm.quotes[index];
              return Card(
                margin: const EdgeInsets.all(12),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"${quote.quote}"',
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '- ${quote.author}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
