import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layer_architecture_template/infrastructure/repository/firestore_repository.dart';

final homeService = Provider.autoDispose(
  (ref) => HomeService(
    firestoreRepository: ref.read(fireStoreRepository),
  ),
);

class HomeService {
  HomeService({
    required this.firestoreRepository,
  });

  final FireStoreRepository firestoreRepository;

  /// 新規ルーム作成
  Future<bool> createRoom({
    required String roomId,
    required String roomName,
  }) async {
    try {
      await firestoreRepository.addDocument(
        'rooms/$roomId',
        {
          'roomId': roomId,
          'name': roomName,
          'attendeeUidList': [],
          'createdAt': DateTime.now(),
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
