// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomModel _$$_RoomModelFromJson(Map<String, dynamic> json) => _$_RoomModel(
      roomId: json['roomId'] as String,
      ownerId: json['ownerId'] as String,
      pointType: json['pointType'] as String,
      userList:
          (json['userList'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_RoomModelToJson(_$_RoomModel instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'ownerId': instance.ownerId,
      'pointType': instance.pointType,
      'userList': instance.userList,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
