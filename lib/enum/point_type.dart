enum PointType {
  fibonacci('fibonacci'),
  increment('increment'),
  multipleOfTwo('multipleOfTwo'),
  custom('custom'),
  ;

  const PointType(this.value);

  final String value;
}

// 文字列からenumを取得する
PointType pointTypeFromString(String value) {
  return PointType.values.firstWhere((e) => e.value == value);
}
