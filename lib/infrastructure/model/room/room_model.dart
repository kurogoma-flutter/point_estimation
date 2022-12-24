import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_model.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required String roomId,
    required String pointType,
    required List<String> userIds,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      roomId: map['roomId'] as String,
      pointType: map['pointType'] as String,
      userIds: List<String>.from(map['userIds'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'roomId': roomId,
      'pointType': pointType,
      'userIds': userIds,
    };
  }

  // fromSnapshot
  factory RoomModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return RoomModel(
      roomId: snapshot['roomId'] as String,
      pointType: snapshot['pointType'] as String,
      userIds: List<String>.from(snapshot['userIds'] as List<dynamic>),
    );
  }
}
