import 'package:flutter/material.dart';
import '../main.dart';
String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) return 'Please enter email';
  if (!value.contains('@') || value.startsWith('@') || value.endsWith('@')) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) return 'Please enter password';
  if (value.trim().length < 6) return 'Password must be at least 6 characters';
  return null;
}
