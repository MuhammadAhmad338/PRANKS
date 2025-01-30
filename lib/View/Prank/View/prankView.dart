import 'package:flutter/material.dart';

class PrankScreen extends StatelessWidget {
  const PrankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Prank'),
      ),    
      body: const Column(
        children: const [
          Text('Prank'),
        ],
      ),
    );
  }
}