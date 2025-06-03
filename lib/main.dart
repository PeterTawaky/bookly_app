import 'package:bookly_app/app/bookly_app.dart';
import 'package:bookly_app/core/dependencies/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(BooklyApp());
}
