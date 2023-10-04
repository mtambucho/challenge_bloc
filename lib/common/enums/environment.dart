enum Environment {
  dev,
  staging,
  prod;

  String toShortString() {
    return toString().split('.').last;
  }

  String get bundleSuffix => switch (this) {
        Environment.prod => '.',
        _ => '.${toShortString()}',
      };

  String get fileName => switch (this) {
        _ => 'assets/.env',
      };
}
