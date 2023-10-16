import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/entities.dart';
import '../../infrastructure/data_sources/data_sources.dart';
import '../../infrastructure/repositories_impl/country_repository_impl.dart';
import '../providers/country_provider.dart';
import '../providers/theme_provider.dart';
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
    final color = ref.watch(themeNotifierProvider).isDarkMode
        ? Colors.grey.shade800
        : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Back'),
            // TODO: Fix return to previous country
            onPressed: () => GoRouter.of(context).pop(),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(color),
              elevation: const MaterialStatePropertyAll(5),
            ),
          ),
          const SizedBox(height: 50),
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
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );

    final borders = country.borderCountries;

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
            _BorderCountries(borders),
          ],
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
    final String? nativeName = country.nativeName;
    final String population = country.population.toString();
    final String region = country.region;
    final String? subregion = country.subregion;
    final String capital = country.capital;
    final String topLevelDomain = country.topLevelDomain.isEmpty
        ? 'No currencies'
        : country.topLevelDomain.first;
    final String currencies = country.currencies.length == 1
        ? country.currencies.first
        : country.currencies.map((e) => e).toList().join(', ');
    final String languages = country.languages.length == 1
        ? country.languages.first
        : country.languages.map((e) => e).toList().join(', ');

    return SizedBox(
      height: 120,
      child: Wrap(
        direction: Axis.vertical,
        runSpacing: 80,
        spacing: 10,
        children: [
          // Native Name
          _TextInfo(title: 'Native Name', value: nativeName),
          // Population
          _TextInfo(title: 'Population', value: population),
          // Region
          _TextInfo(title: 'Region', value: region),
          // Sub Region
          _TextInfo(title: 'Sub Region', value: subregion),
          // Capital
          _TextInfo(title: 'Capital', value: capital),
          // Top Level Domain
          _TextInfo(title: 'Top Level Domain', value: topLevelDomain),
          // Currencies
          _TextInfo(title: 'Currencies', value: currencies),
          // Languages
          _TextInfo(title: 'Languages', value: languages),
        ],
      ),
    );
  }
}

class _TextInfo extends StatelessWidget {
  final String title;
  final String? value;

  const _TextInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: IconTheme.of(context).color,
      fontWeight: FontWeight.bold,
    );

    return RichText(
      text: TextSpan(
        style: style,
        text: title,
        children: [
          const TextSpan(text: ': '),
          TextSpan(
            style: const TextStyle(fontWeight: FontWeight.normal),
            text: value,
          ),
        ],
      ),
    );
  }
}

class _BorderCountries extends ConsumerWidget {
  final List<String> borders;

  const _BorderCountries(this.borders);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title =
        borders.isEmpty ? 'Don\'t have border countries' : 'Border Countries:';
    return Wrap(
      spacing: 20,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 10,
          children: borders.map((border) => _BorderCountry(border)).toList(),
        ),
      ],
    );
  }
}

class _BorderCountry extends ConsumerWidget {
  final String border;

  const _BorderCountry(this.border);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onTap() async => GoRouter.of(context).pushNamed(
          CountryScreen.name,
          pathParameters: {
            'countryName': await CountryRepositoryImpl(ProjectDataSource())
                .getCountryByCode(border)
                .then((value) => value.name)
          },
        );

    final color = ref.watch(themeNotifierProvider).isDarkMode
        ? Colors.blueGrey.shade800
        : Colors.white12;

    const borderRadius = BorderRadius.all(Radius.circular(5));

    final decoration = BoxDecoration(color: color, borderRadius: borderRadius);

    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: borderRadius,
        elevation: 5,
        child: Container(
          decoration: decoration,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(border),
        ),
      ),
    );
  }
}
