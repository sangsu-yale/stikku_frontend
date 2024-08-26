import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/user_model.dart';

part 'event_model.g.dart';

@Collection()
class Event {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime eventDate;

  List<String> eventDetails = [];

  final user = IsarLink<User>();
}

// 예시: eventDate와 eventDetails를 분리해서 저장하는 방법