import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/api_service.dart';

class QuoteViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();

  List<Quote> quotes = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadQuotes() async {
    isLoading = true;
    notifyListeners();

    try {
      quotes = await apiService.fetchQuotes();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
