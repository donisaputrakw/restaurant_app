import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/search/search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.searchApiDataSource,
    required this.networkInfo,
  }) : super(SearchInitial()) {
    on<SearchRestaurantEvent>(
      _searchRestaurant,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }

  final SearchApiDataSource searchApiDataSource;
  final NetworkInfo networkInfo;

  Future _searchRestaurant(
    SearchRestaurantEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected) {
        emit(SearchLoading());
        if (event.query == '') {
          emit(
            const SearchSuccess(
              data: SearchRestaurantsModel(
                error: false,
                restaurants: [],
                founded: 0,
              ),
            ),
          );
        } else {
          final result = await searchApiDataSource.searchRestaurants(
            query: event.query,
          );
          if (result.error) {
            emit(const SearchFailure('Data not found'));
          } else {
            emit(SearchSuccess(data: result));
          }
        }
      } else {
        emit(const NotConnectedSearch(
            'silahkan periksa konesi internet kamu terlebih dahulu, jika sudah silahkan coba kembali'));
      }
    } catch (exception, stackTrace) {
      emit(
        SearchFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }
}
