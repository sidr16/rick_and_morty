import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../router/app_router.dart';
import '../../utils/extensions/context_extension.dart';

enum SnackbarType {
  error(color: Colors.red, icon: Icons.error),
  success(color: Colors.green, icon: Icons.check_circle),
  info(color: Colors.amber, icon: Icons.info);

  const SnackbarType({required this.color, required this.icon});

  final Color color;
  final IconData icon;
}

class SnackbarManager {
  static void show({
    required String message,
    SnackbarType type = SnackbarType.info,
  }) {
    final context = rootNavigatorKey.currentContext;

    if (context == null) return;

    final snackbar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              type.icon,
              color: type.color,
            ),
            const Gap(12),
            Expanded(
              child: Text(
                message,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: type.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackbar);
  }
}
