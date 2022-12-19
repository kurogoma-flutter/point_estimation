import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data_source/firestore_data_source.dart';

/// Provider
final fireStoreRepository = Provider(
  (ref) => FireStoreRepository(
    firestoreDataSource: FireStoreDataSource(),
  ),
);

/// Firestore関連メソッドのリポジトリ
class FireStoreRepository {
  FireStoreRepository({
    required this.firestoreDataSource,
  });

  final FireStoreDataSource firestoreDataSource;
}
