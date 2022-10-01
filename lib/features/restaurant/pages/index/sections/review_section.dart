part of '../page.dart';

class _ReviewSection extends StatelessWidget {
  const _ReviewSection({
    required this.descController,
    required this.nameController,
    this.onPressed,
  });
  final TextEditingController nameController;
  final TextEditingController descController;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.submitReview,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: Dimens.dp8),
          RegularInput(
            controller: nameController,
            hintText: context.l10n.name,
          ),
          const SizedBox(height: Dimens.dp8),
          RegularInput(
            controller: descController,
            hintText: context.l10n.description,
            minLine: 3,
            maxLine: 3,
          ),
          const SizedBox(height: Dimens.dp8),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              context.l10n.submit.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: Dimens.dp32),
        ],
      ),
    );
  }
}
