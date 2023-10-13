import 'package:flutter/material.dart';

import '../widgets/toggle_dark_mode_button.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'Home';
  static const String path = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Where in the world?'),
          actions: const [
            ToggleDarkModeButton(),
          ],
        ),
        body: const _View(),
      );
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          // Top Layout
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                // TODO: Implement search funcionality
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a country...',
                    labelText: 'Country Name',
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
              // TODO: Replace with toggle filter widget
              Text('Filter by Region'),
            ],
          ),
          // Spacer
          SizedBox(height: 10),
          // Country list
        ],
      ),
    );
  }
}
