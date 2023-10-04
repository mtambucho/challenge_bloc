import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deeplink_state.freezed.dart';

@freezed
class DeepLinkState with _$DeepLinkState {
  const factory DeepLinkState.initial() = Initial;
  const factory DeepLinkState.linkPending(DeepLinkRedirect link) = LinkPending;
  const factory DeepLinkState.ready() = Ready;
}
