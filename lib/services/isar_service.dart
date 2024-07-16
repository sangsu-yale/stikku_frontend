import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/settings_model.dart';
import 'package:stikku_frontend/models/user_model.dart';

// 싱글톤 패턴 방식
// DB 연결을 관리하는 역할
class IsarService {
  // IsarService._internal() 생성자를 통해 내부적으로 생성된 인스턴스를 저장
  static final IsarService _instance = IsarService._internal();
  late Isar _isar;

  // IsarService()는 항상 _instance만 반환하도록 함
  factory IsarService() {
    return _instance;
  }

  IsarService._internal();

  // DB 초기화 메서드
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserSchema, GameResultSchema, SettingsSchema, EventSchema],
      directory: dir.path,
    );
  }

  // _isar 변수에 저장된 DB 인스턴스를 반환
  // 클래스 외부에서 DB 인스턴스에 접근 가능
  Isar get isar => _isar;
}
