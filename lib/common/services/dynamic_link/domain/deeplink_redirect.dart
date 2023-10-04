import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:equatable/equatable.dart';

class DeepLinkRedirect extends Equatable {
  const DeepLinkRedirect({
    required this.event,
    required this.params,
  });
  final DeepLinkRedirectEvent event;
  final Map<String, String> params;

  @override
  List<Object?> get props => [event, params];

  String get createLink {
    final path = event.path;
    final paramsString =
        params.entries.map((e) => '${e.key}=${e.value}').join('&');
    return '$path/?$paramsString';
  }
}
