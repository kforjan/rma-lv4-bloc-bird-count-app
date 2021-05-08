import 'package:flutter/material.dart';
import 'package:rma_lv4_bird_counting_bloc/injection_container.dart' as di;
import 'package:rma_lv4_bird_counting_bloc/ui/home_screen.dart';

void main() {
  di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bird Counter',
      home: HomeScreen(),
    );
  }
}
