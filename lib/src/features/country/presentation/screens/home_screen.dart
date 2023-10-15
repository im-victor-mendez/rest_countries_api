import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/entities.dart';
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
  List<Country> countryList = [];
  List<Country> filteredCountryList = [];

  final searchCountryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.read(countryListNotifierProvider.notifier).getList();
  }

  @override
  Widget build(BuildContext context) {
    if (countryList.isEmpty) {
      setState(() {
        countryList = ref.watch(countryListNotifierProvider);
        filteredCountryList = countryList;
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          // Top Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Search country
              _SearchCountryField(
                controller: searchCountryController,
                onChanged: searchCountry,
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
                country: filteredCountryList[index],
                spacing: 50,
              ),
              itemCount: filteredCountryList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchCountry(String value) =>
      setState(() => filteredCountryList = countryList
          .where((country) => value.isNotEmpty
              ? country.name.toLowerCase().contains(value.toLowerCase())
              : true)
          .toList());
}

class _SearchCountryField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const _SearchCountryField({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Search for a country...',
          labelText: 'Country Name',
          prefixIcon: Icon(Icons.search_rounded),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
