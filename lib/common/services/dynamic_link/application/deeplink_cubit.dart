import 'dart:async';
import 'dart:developer';

import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeepLinkCubit extends Cubit<DeepLinkState> {
  DeepLinkCubit(this._links) : super(const DeepLinkState.initial()) {
    _initDeepLinking();
  }

  final FirebaseDeepLinkRepository _links;
  StreamSubscription<Uri>? _linksSubscription;

  Future<void> _initDeepLinking() async {
    _linksSubscription = _links.getLinks().listen(
          addPending,
        );
    final deeplink = await _links.getInitialLink();
    if (deeplink != null) {
      addPending(deeplink);
    } else {
      emit(const Ready());
    }
  }

  void addPending(Uri uri) {
    try {
      final event = DeepLinkRedirectEvent.from(uri);
      emit(
        DeepLinkState.linkPending(
          DeepLinkRedirect(
            event: event,
            params: uri.queryParameters,
          ),
        ),
      );
    } catch (e) {
      log(e.toString(), error: e);
      emit(const Ready());
    }
  }

  void consumeDeepLink() {
    emit(const Ready());
  }

  Future<Uri?> createDynamicLink(String link) async {
    return _links.createDynamicLink(link: link);
  }

  @override
  Future<void> close() {
    _linksSubscription?.cancel();
    _links.closeLinksStream();
    return super.close();
  }
}
