import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:challenge_bloc/common/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    required this.createShareLink,
    super.key,
  });
  final ShareData Function() createShareLink;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final data = createShareLink.call();
        final link = await context.read<DeepLinkCubit>().createDynamicLink(
              data.link,
            );

        ///share the link
        await Share.share(
          link.toString(),
          subject: data.subject,
        );
      },
      icon: const Icon(
        Icons.share_outlined,
        color: AppColors.disabledIcon,
      ),
    );
  }
}

class ShareData {
  ShareData({required this.link, required this.subject});

  final String link;
  final String subject;
}
