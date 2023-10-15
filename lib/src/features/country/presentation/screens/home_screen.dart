import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/regions.dart';
import '../providers/country_list_provider.dart';
import '../widgets/widgets.dart';

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

class _View extends ConsumerStatefulWidget {
  const _View();

  @override
  ConsumerState<_View> createState() => _ViewState();
}

class _ViewState extends ConsumerState<_View> {
  Regions? region;
  @override
  Widget build(BuildContext context) {
    ref.read(countryListNotifierProvider.notifier).getList();

    final countryList = ref.watch(countryListNotifierProvider);

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
                // TODO: Implement search functionality
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a country...',
                    labelText: 'Country Name',
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
              // Filter by region
              // TODO: Implement filter functionality
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
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 50,
                mainAxisExtent: 280,
                mainAxisSpacing: 50,
              ),
              itemBuilder: (context, index) => CountryWidget(
                country: countryList[index],
                spacing: 50,
              ),
              itemCount: countryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
