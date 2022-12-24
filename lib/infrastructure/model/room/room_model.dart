import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layer_architecture_template/infrastructure/model/firestore_timestamp.dart';

part 'room_model.freezed.dart';

part 'room_model.g.dart';

@freezed
abstract class RoomModel with _$RoomModel {
  const factory RoomModel({
    required String roomId, // 識別用ID
    required String ownerId, // 作成者ID
    required String pointType, // ポイントタイプ
    required List<String> userList, // 参加者一覧
    @CreatedAtField() DateTime? createdAt, // 作成日時
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  factory RoomModel.initialData() => RoomModel(
        roomId: '',
        ownerId: '',
        pointType: '',
        userList: [],
        createdAt: DateTime.now(),
      );

  factory RoomModel.fromMap(Map<String, dynamic> data) => RoomModel(
        roomId: data['roomId'],
        ownerId: data['ownerId'],
        pointType: data['pointType'],
        userList: data['userList'],
        createdAt: data['createdAt'],
      );
}
