import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore関連メソッドのデータソース
class FireStoreDataSource {
  /// Firestoreのインスタンス
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// FirestoreのコレクションをFutureで取得する
  Future<List<Map<String, dynamic>>> fetchCollectionAsFuture(
    String path,
  ) async {
    final QuerySnapshot snapshot = await _firestore.collection(path).get();
    final List<Map<String, dynamic>> list = snapshot.docs
        .map((DocumentSnapshot document) =>
            document.data() as Map<String, dynamic>)
        .toList();
    return list;
  }

  /// FirestoreのコレクションをStreamで取得する
  Stream<List<Map<String, dynamic>>> fetchCollectionAsStream(
    String path,
  ) {
    return _firestore.collection(path).snapshots().map(
        (QuerySnapshot snapshot) => snapshot.docs
            .map((DocumentSnapshot document) =>
                document.data() as Map<String, dynamic>)
            .toList());
  }

  /// Firestoreのドキュメントを取得する
  Future<Map<String, dynamic>> fetchDocumentAsFuture(String path) async {
    final DocumentSnapshot snapshot = await _firestore.doc(path).get();
    return snapshot.data() as Map<String, dynamic>;
  }

  /// Firestoreのドキュメントを追加する
  Future<void> addDocument(String path, Map<String, dynamic> data) async {
    await _firestore.doc(path).set(data);
  }

  /// Firestoreのドキュメントを更新する
  Future<void> updateDocument(String path, Map<String, dynamic> data) async {
    await _firestore.doc(path).update(data);
  }

  /// Firestoreのドキュメントを削除する
  Future<void> deleteDocument(String path) async {
    await _firestore.doc(path).delete();
  }

  /// ドキュメントが存在するかどうかを取得する
  Future<bool> isExistDocument(String path) async {
    final DocumentSnapshot snapshot = await _firestore.doc(path).get();
    return snapshot.exists;
  }
}
