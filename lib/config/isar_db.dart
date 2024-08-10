import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_id_mapping_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/game_review_model.dart';
import 'package:stikku_frontend/models/settings_model.dart';
import 'package:stikku_frontend/models/user_model.dart';

// 싱글톤 패턴 방식
// DB 연결을 관리하는 역할
class IsarDB {
  // IsarDB._internal() 생성자를 통해 내부적으로 생성된 인스턴스를 저장
  static final IsarDB _instance = IsarDB._internal();
  late Isar _isar;

  // IsarDB()는 항상 _instance만 반환하도록 함
  factory IsarDB() {
    return _instance;
  }

  IsarDB._internal();

  // DB 초기화 메서드
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        UserSchema,
        GameResultSchema,
        GameReviewSchema,
        GameResultIdMappingSchema,
        SettingsSchema,
        EventSchema
      ],
      directory: dir.path,
    );
  }

  // _isar 변수에 저장된 DB 인스턴스를 반환
  // 클래스 외부에서 DB 인스턴스에 접근 가능
  Isar get isar => _isar;
}
