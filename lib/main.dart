import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1/riverpod/provider_observer.dart';
import 'package:v1/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope( //Provider Scope
      observers: [ //Provider observer
        Logger(),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    )
  );
}