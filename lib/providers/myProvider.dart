
import 'package:flutter/material.dart';

class myProvider extends ChangeNotifier {
  String lang = 'en';
  void language(language) {
    lang = language;
    notifyListeners();
  }
}
