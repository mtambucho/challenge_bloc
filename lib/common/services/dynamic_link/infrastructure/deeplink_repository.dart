import 'dart:async';

import 'package:challenge_bloc/common/utils/constants/constants.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class FirebaseDeepLinkRepository {
  factory FirebaseDeepLinkRepository() {
    return _instance;
  }

  FirebaseDeepLinkRepository._internal();
  static final FirebaseDeepLinkRepository _instance =
      FirebaseDeepLinkRepository._internal();

  final FirebaseDynamicLinks _links = FirebaseDynamicLinks.instance;
  final StreamController<Uri> _controller = StreamController<Uri>();

  //helper method to close our controller sink
  void closeLinksStream() {
    _controller.close();
  }

  //setup onLink listener and put results on a stream
  Stream<Uri> getLinks() {
    _links.onLink.listen(
      (data) {
        final deepLink = data.link;
        _controller.add(deepLink);
      },
      onError: (_) {
        _controller.addError(
          'Error retrieving dynamic link',
        );
      },
    );
    return _controller.stream;
  }

  //get initial launch deeplink link if application was closed
  //
  //and onLink not yet setup
  Future<Uri?> getInitialLink() async {
    final data = await _links.getInitialLink();
    return data?.link;
  }

  //create a dynamic link programmatically
  ///[link] is the path to the content after the url prefix
  ///fe. 'recipes/?recipeCode=123'
  ///
  Future<Uri?> createDynamicLink({
    required String link,
    bool short = true,
  }) async {
    final parameters = DynamicLinkParameters(
      uriPrefix: AppConstants.dynamicLinkUrlPrefix,
      link: Uri.parse(
        '${AppConstants.dynamicLinkUrlPrefix}/$link',
      ),
      androidParameters: AndroidParameters(
        packageName: AppConstants.packageName,
        minimumVersion: 0,
      ),
    );

    late final Uri url;
    if (short) {
      final shortLink = await _links.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await _links.buildLink(parameters);
    }
    return url;
  }
}
