import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newspackage/src/data/models/article_response.dart';
// import 'package:newspackage/src/data/model/article.dart';


part 'newspress_state.freezed.dart';

/// Extension method for easy comparison
extension NewspressGetters on NewspressState {
  bool get isLoading => this is _NewspressLoading;
}

@freezed
abstract class NewspressState with _$NewspressState {
  /// Data is present state
  const factory NewspressState.data({required List<Article> news}) = _NewspressData;

  /// Initial/default state
  const factory NewspressState.initial() = _NewspressInitial;

  /// Data is loading state
  const factory NewspressState.loading() = _NewspressLoading;

  /// Error when loading data state
  const factory NewspressState.error([String? message]) = _NewspressError;

    // bool get isLoading => this is _NewspressLoading;


}