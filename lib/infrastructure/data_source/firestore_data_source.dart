import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore関連メソッドのデータソース
class FireStoreDataSource {
  /// Firestoreのインスタンス
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Firestoreのコレクションを取得する
  CollectionReference fetchCollection(String path) {
    return _firestore.collection(path);
  }

  /// Firestoreのドキュメントを取得する
  DocumentReference fetchDocument(String path) {
    return _firestore.doc(path);
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
