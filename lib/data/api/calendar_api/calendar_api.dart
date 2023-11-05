import 'package:everfam/data/models/dto/calendar_event.dart';

abstract class CalendarApi {
  Future<void> addEvent();

  Future<void> removeEvent();

  Future<List<CalendarEvent>> getEvents();
}
