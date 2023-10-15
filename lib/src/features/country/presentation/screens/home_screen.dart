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

    final subtitle =
        region == null ? null : Text(regionValueToKey(region!).toString());

    final filters = regionValues.entries
        .map((entry) => RadioListTile.adaptive(
              groupValue: region,
              onChanged: regionFilter,
              title: Text(entry.key),
              value: entry.value,
            ))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          // Top Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SearchCountryField(
                controller: searchCountryController,
                onChanged: searchCountry,
              ),
              _FilterByRegion(filters: filters, subtitle: subtitle),
            ],
          ),
          // Spacer
          const SizedBox(height: 10),
          _CountryList(filteredCountryList),
        ],
      ),
    );
  }

  void regionFilter(Regions? value) {
    setState(() => region = value);

    setState(() => filteredCountryList = countryList.where((country) {
          final region = regionValueToKey(value!);
          final isEqualRegion = country.region.contains(region!);

          final search = searchCountryController.text;

          if (search.isEmpty) return country.region.contains(region);

          return isEqualRegion &&
              country.name.toLowerCase().contains(search.toLowerCase());
        }).toList());
  }

  void searchCountry(String value) =>
      setState(() => filteredCountryList = countryList.where((country) {
            final countryNameContainsSearch =
                country.name.toLowerCase().contains(value.toLowerCase());

            if (region == null) {
              return value.isNotEmpty ? countryNameContainsSearch : true;
            }

            final countryRegionIsEqual =
                country.region.contains(regionValueToKey(region!)!);

            return value.isNotEmpty
                ? countryNameContainsSearch && countryRegionIsEqual
                : countryRegionIsEqual;
          }).toList());
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

class _FilterByRegion extends StatelessWidget {
  final List<RadioListTile<Regions>> filters;
  final Text? subtitle;

  const _FilterByRegion({
    required this.filters,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ExpansionTile(
        subtitle: subtitle,
        title: const Text('Filter by Region'),
        children: filters,
      ),
    );
  }
}

class _CountryList extends StatelessWidget {
  /// To use a filtered list
  final List<Country> list;

  const _CountryList(this.list);

  @override
  Widget build(BuildContext context) => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 50,
            mainAxisExtent: 280,
            mainAxisSpacing: 50,
          ),
          itemBuilder: (context, index) => CountryWidget(
            country: list[index],
            spacing: 50,
          ),
          itemCount: list.length,
        ),
      );
}
