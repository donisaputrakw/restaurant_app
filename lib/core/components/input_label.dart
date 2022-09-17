import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    Key? key,
    this.label,
    this.isRequired,
  }) : super(key: key);

  final String? label;
  final bool? isRequired;
  @override
  Widget build(BuildContext context) {
    if (label == null) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label ?? ''),
            const SizedBox(width: Dimens.dp8),
            if (isRequired == true) const Text('(required)')
          ],
        ),
        const SizedBox(height: Dimens.dp8),
      ],
    );
  }
}
