import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/entities.dart';
import '../providers/country_provider.dart';
import '../widgets/widgets.dart';

class CountryScreen extends StatelessWidget {
  // TODO: To implement
  static const String name = 'TO IMPLEMENT';
  static const String path = '/:countryName';

  final String? countryName;

  const CountryScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: const [ToggleDarkModeButton()],
          automaticallyImplyLeading: false,
          title: const Text('Where in the world?'),
        ),
        body: _View(countryName ?? ''),
      );
}

class _View extends ConsumerStatefulWidget {
  final String countryName;

  const _View(this.countryName);

  @override
  ConsumerState<_View> createState() => _ViewState();
}

class _ViewState extends ConsumerState<_View> {
  Country country = Country.empty();

  @override
  void initState() {
    super.initState();

    ref
        .read(countryNotifierProvider.notifier)
        .getCountryByName(widget.countryName);
  }

  @override
  Widget build(BuildContext context) {
    setState(() => country = ref.watch(countryNotifierProvider));

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Back'),
          ),
          const SizedBox(height: 20),
          _Country(country: country),
        ],
      ),
    );
  }
}

class _Country extends StatelessWidget {
  final Country country;

  const _Country({required this.country});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: IconTheme.of(context).color,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(country.flagUrl ??
            // TODO: Change loading image
            'https://media.istockphoto.com/vectors/no-image-available-icon-vector-id1216251206?k=6&m=1216251206&s=612x612&w=0&h=G8kmMKxZlh7WyeYtlIHJDxP5XRGm9ZXyLprtVJKxd-o='),
        Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            Text(country.name, style: style),
            _Info(country: country),
            _BorderCountries(country: country),
          ],
        ),
      ],
    );
  }
}

class _BorderCountries extends StatelessWidget {
  final Country country;

  const _BorderCountries({required this.country});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: [
        const Text(
          'Border Countries:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 10,
          // TODO: Implement background color
          children:
              country.borderCountries.map((country) => Text(country)).toList(),
        ),
      ],
    );
  }
}

class _Info extends StatelessWidget {
  final Country country;

  const _Info({required this.country});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Wrap(
        direction: Axis.vertical,
        runSpacing: 80,
        spacing: 10,
        children: [
          // Native Name
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Native Name',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.nativeName,
                ),
              ],
            ),
          ),
          // Population
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Population',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.population.toString(),
                ),
              ],
            ),
          ),
          // Region
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Region',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.region,
                ),
              ],
            ),
          ),
          // Sub Region
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Sub Region',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.subregion,
                ),
              ],
            ),
          ),
          // Capital
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Capital',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.capital,
                ),
              ],
            ),
          ),
          // Top Level Domain
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Top Level Domain',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.topLevelDomain.isEmpty
                      ? 'No currencies'
                      : country.topLevelDomain.first,
                ),
              ],
            ),
          ),
          // Currencies
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Currencies',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.currencies.length == 1
                      ? country.currencies.first
                      : country.currencies.map((e) => e).toList().join(', '),
                ),
              ],
            ),
          ),
          // Languages
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: IconTheme.of(context).color,
                fontWeight: FontWeight.bold,
              ),
              text: 'Languages',
              children: [
                const TextSpan(text: ': '),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: country.languages.length == 1
                      ? country.languages.first
                      : country.languages.map((e) => e).toList().join(', '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
