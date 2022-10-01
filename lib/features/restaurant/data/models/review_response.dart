import 'package:restaurant_app/features/restaurant/restaurant.dart';

class ReviewResponse {
  ReviewResponse({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => ReviewResponse(
        error: json['error'],
        message: json['message'],
        customerReviews: List<CustomerReview>.from(
            json['customerReviews'].map((x) => CustomerReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'customerReviews':
            List<dynamic>.from(customerReviews.map((x) => x.toJson())),
      };
}
