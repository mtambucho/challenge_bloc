import 'package:collection/collection.dart';

enum DeepLinkRedirectEvent {
  recipeDetails;

  String get path {
    switch (this) {
      case DeepLinkRedirectEvent.recipeDetails:
        return 'recipes';
    }
  }

  static DeepLinkRedirectEvent from(Uri uri) {
    final event = DeepLinkRedirectEvent.values
        .firstWhereOrNull((x) => x.path == uri.pathSegments.first);
    if (event != null) {
      return event;
    }
    throw ArgumentError.value(uri, 'uri', 'Invalid deeplink');
  }
}
