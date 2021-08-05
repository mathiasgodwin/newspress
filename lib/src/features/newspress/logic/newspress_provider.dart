import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_manager/network_manager.dart';
import 'package:newspackage/newspress.dart' show GetHeadLine, GetSearch, INewspressRepository, IRemoteDataSource, NewspressRepository, RemoteDataSource;





import 'newspress_state.dart';
export 'newspress_state.dart';


part 'newspress_state_notifier.dart';

/// Provider to use the NewspressStateNotifier
final newspressNotifierProvider = StateNotifierProvider<NewspressNotifier, NewspressState>(
  (ref) => NewspressNotifier(getHeadLine: ref.watch(newsHeadLineProvider), getSearch: ref.watch(newsSearchProvider)),
);

/// Repositories Providers
final newsRepProvider = Provider<INewspressRepository>(
  (_) => NewspressRepository(
    networkManager: NetworkManager(DataConnectionChecker()),
    remoteDataSource: RemoteDataSource(),
  ),
);

/// Use Cases Providers
final newsHeadLineProvider  = Provider<GetHeadLine>(
  (refH) {
    final repository = refH.watch(newsRepProvider);
    return GetHeadLine(repository: repository);
  });

  final newsSearchProvider  = Provider<GetSearch>(
  (refS) {
    final repository = refS.watch(newsRepProvider);
    return GetSearch(repository: repository);
  }
);