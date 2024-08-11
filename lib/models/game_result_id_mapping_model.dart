import 'package:isar/isar.dart';

part 'game_result_id_mapping_model.g.dart';

@Collection()
class GameResultIdMapping {
  Id id = Isar.autoIncrement;

  final int localGameResultId;
  final int serverGameResultId;
  final int serverGameReviewId;

  @Index()
  DateTime? createdAt;

  // 생성자에서 DateTime 타입의 매개변수를 사용
  GameResultIdMapping({
    required this.localGameResultId,
    required this.serverGameResultId,
    required this.serverGameReviewId,
    DateTime? createdAt, // Optional DateTime parameter
  }) : createdAt = createdAt ?? DateTime.now(); // 초기화 시 기본값 설정
}
