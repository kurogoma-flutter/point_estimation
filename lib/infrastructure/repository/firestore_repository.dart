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

  /// コレクションをStreamで取得
  Stream<List<Map<String, dynamic>>> fetchCollectionAsStream(
    String path,
  ) {
    return firestoreDataSource.fetchCollectionAsStream(path);
  }

  /// コレクションをFutureで取得
  Future<List<Map<String, dynamic>>> fetchCollectionAsFuture(
    String path,
  ) {
    return firestoreDataSource.fetchCollectionAsFuture(path);
  }

  /// Firestoreのドキュメントを取得する
  Future<Map<String, dynamic>> fetchDocumentAsFuture(String path) async {
    return firestoreDataSource.fetchDocumentAsFuture(path);
  }

  /// Firestoreのドキュメントを追加する
  Future<bool> addDocument(String path, Map<String, dynamic> data) async {
    try {
      await firestoreDataSource.addDocument(path, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Firestoreのドキュメントを更新する
  Future<bool> updateDocument(String path, Map<String, dynamic> data) async {
    try {
      await firestoreDataSource.updateDocument(path, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Firestoreのドキュメントを削除する
  Future<bool> deleteDocument(String path) async {
    try {
      await firestoreDataSource.deleteDocument(path);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// ドキュメントが存在するかどうかを取得する
  Future<bool> isExistDocument(String path) async {
    return firestoreDataSource.isExistDocument(path);
  }
}
