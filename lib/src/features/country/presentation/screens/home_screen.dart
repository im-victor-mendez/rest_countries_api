import 'package:flutter/material.dart';
import 'package:rest_countries_api/src/features/country/domain/entities/regions.dart';

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

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  Regions? region;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          // Top Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
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
              SizedBox(
                width: 200,
                child: ExpansionTile(
                  title: const Text('Filter by Region'),
                  children: regionValues.entries
                      .map((entry) => RadioListTile.adaptive(
                            groupValue: region,
                            onChanged: (value) =>
                                setState(() => region = value),
                            title: Text(entry.key),
                            value: entry.value,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          // Spacer
          const SizedBox(height: 10),
          // Country list
        ],
      ),
    );
  }
}
