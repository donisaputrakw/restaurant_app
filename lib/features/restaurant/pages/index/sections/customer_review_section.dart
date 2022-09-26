part of '../page.dart';

class _CustomerReviewSection extends StatefulWidget {
  const _CustomerReviewSection({
    required this.reviews,
  });
  final List<CustomerReview> reviews;

  @override
  State<_CustomerReviewSection> createState() => _CustomerReviewSectionState();
}

class _CustomerReviewSectionState extends State<_CustomerReviewSection> {
  late bool isHide = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Customer Reviews', style: textTheme.subtitle1),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(Dimens.defaultPadding),
                onTap: () {
                  setState(() {
                    isHide = !isHide;
                  });
                },
                child: Text(
                  (isHide) ? 'Show' : 'Hide',
                  style: textTheme.caption?.copyWith(color: AppColors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimens.dp8),
          (isHide == true)
              ? const SizedBox()
              : ((widget.reviews.isEmpty)
                  ? Text(
                      'No reviews yet',
                      style: textTheme.bodyLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: widget.reviews
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.all(
                                Dimens.defaultPadding,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: Dimens.dp8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(Dimens.dp16),
                                  topRight: Radius.circular(Dimens.dp16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name,
                                    style: textTheme.subtitle2
                                        ?.copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(height: Dimens.dp4),
                                  Text(
                                    '"${e.review}"',
                                    style: textTheme.bodyLarge?.copyWith(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  const SizedBox(height: Dimens.dp4),
                                  Text(
                                    e.date,
                                    style: textTheme.caption
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    )),
        ],
      ),
    );
  }
}
