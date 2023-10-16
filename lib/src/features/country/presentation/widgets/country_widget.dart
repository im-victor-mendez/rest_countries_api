import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rest_countries_api/src/features/country/presentation/providers/theme_provider.dart';

import '../../domain/entities/country.dart';
import '../screens/screens.dart';

class CountryWidget extends ConsumerWidget {
  final Country country;
  final double spacing;

  const CountryWidget({
    super.key,
    required this.country,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = (MediaQuery.of(context).size.width / 4) - spacing;
    const padding = EdgeInsets.symmetric(horizontal: 10);
    const style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    final decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      color: ref.watch(themeNotifierProvider).isDarkMode
          ? Colors.blueGrey.shade800
          : Colors.white12,
    );

    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        CountryScreen.name,
        pathParameters: {'countryName': country.name},
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        elevation: 10,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: decoration,
          child: Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              // Flag
              Image.network(
                country.flagUrl ?? '',
                width: width,
                height: 150,
                fit: BoxFit.fill,
              ),
              // Name
              Padding(
                  padding: padding, child: Text(country.name, style: style)),
              // Main info
              Padding(
                padding: padding,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.vertical,
                  spacing: 5,
                  children: [
                    _MainInfo(title: 'Population', value: country.population),
                    _MainInfo(title: 'Region', value: country.region),
                    _MainInfo(title: 'Capital', value: country.capital),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainInfo extends StatelessWidget {
  final String title;
  final dynamic value;

  const _MainInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      color: IconTheme.of(context).color,
    );

    return RichText(
      text: TextSpan(
        style: style,
        text: title,
        children: [
          TextSpan(
            text: ': ',
            children: [
              TextSpan(
                text: value.toString(),
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
