// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomModel _$$_RoomModelFromJson(Map<String, dynamic> json) => _$_RoomModel(
      roomId: json['roomId'] as String,
      ownerId: json['ownerId'] as String,
      pointType: $enumDecode(_$PointTypeEnumMap, json['pointType']),
      userList:
          (json['userList'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_RoomModelToJson(_$_RoomModel instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'ownerId': instance.ownerId,
      'pointType': _$PointTypeEnumMap[instance.pointType]!,
      'userList': instance.userList,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };

const _$PointTypeEnumMap = {
  PointType.fibonacci: 'fibonacci',
  PointType.increment: 'increment',
  PointType.multipleOfTwo: 'multipleOfTwo',
  PointType.custom: 'custom',
};
