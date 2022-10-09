import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/features/home/home.dart';

void main() {
  group('fetchRestaurants', () {
    test(
        'return RestaurantsModel for List Restaurant if the http call completes successfully',
        () async {
      final HomeApiDataSource homeApiDataSource = HomeApiDataSourceImpl();

      final result = await homeApiDataSource.fetchRestaurants();

      expect(result, isA<RestaurantsModel>());
    });
  });
}
