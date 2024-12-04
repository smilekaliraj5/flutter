import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Dashboard',
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Dashboard!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
