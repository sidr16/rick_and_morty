import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../utils/extensions/context_extension.dart';

class CharacterCardShimmer extends StatelessWidget {
  const CharacterCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Shimmer(
        color: context.colorScheme.primary,
        child: Container(
          height: 240,
          color: context.colorScheme.surfaceContainerHigh,
        ),
      ),
    );
  }
}
