part of 'newspress_provider.dart';

/// Defines all the Newspress logic the app will use
class NewspressNotifier extends StateNotifier<NewspressState> {
  /// Base constructor expects StateNotifier use_cases to
  // /// read its usecases and also defines inital state
  // NewspressNotifier(
  //     {GetHeadLine? getHeadLine,
  //     GetSearch? getSearch,
  //     // NewspressState? loading
  //     })
  //     : _getHeadLine = getHeadLine!,
  //       _getSearch = getSearch!,
  //       super(NewspressState);

  NewspressNotifier(
      {GetHeadLine? getHeadLine, GetSearch? getSearch, NewspressState? state})
      : _getHeadLine = getHeadLine!,
        _getSearch = getSearch!,
        super(state ?? NewspressState.loading());

  final GetHeadLine _getHeadLine;
  final GetSearch _getSearch;

  Future<void> getHeadLine(country, category) async {
    state = NewspressState.loading();
    final result = await _getHeadLine(country, category);

    result!.fold((error) => state = NewspressState.error(error.toString()),
        (news) => state = NewspressState.data(news: news));
  }

  Future<void> getSearch(q) async {
    state = NewspressState.loading();
    final result = await _getSearch(q);

    result!.fold((error) => state = NewspressState.error(error.toString()),
        (news) => state = NewspressState.data(news: news));
  }
}
