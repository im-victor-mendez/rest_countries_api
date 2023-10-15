enum Regions { africa, america, asia, europe, oceania }

final regionValues = {
  "Africa": Regions.africa,
  "America": Regions.america,
  "Asia": Regions.asia,
  "Europe": Regions.europe,
  "Oceania": Regions.oceania
};

String? regionValueToKey(Regions value) {
  for (final entry in regionValues.entries) {
    if (entry.value == value) return entry.key;
  }
  return null;
}
