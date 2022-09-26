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
            'Submit Review',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: Dimens.dp8),
          RegularInput(
            controller: nameController,
            hintText: 'Name',
          ),
          const SizedBox(height: Dimens.dp8),
          RegularInput(
            controller: descController,
            hintText: 'Description',
            minLine: 3,
            maxLine: 3,
          ),
          const SizedBox(height: Dimens.dp8),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              'SUBMIT',
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
