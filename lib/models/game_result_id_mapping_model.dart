import 'package:isar/isar.dart';

part 'game_result_id_mapping_model.g.dart';

@Collection()
class GameResultIdMapping {
  Id id = Isar.autoIncrement;

  late int localGameResultId; // 로컬 DB의 ID
  late int serverGameResultId; // 서버의 게임 리졸트 ID
  late int serverGameReviewId; // 서버의 게임 리뷰 ID

  @Index()
  late DateTime createdAt;

  GameResultIdMapping({
    required this.localGameResultId,
    required this.serverGameResultId,
    required this.serverGameReviewId,
  });
}
