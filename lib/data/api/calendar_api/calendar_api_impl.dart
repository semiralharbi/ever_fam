import 'package:everfam/data/api/calendar_api/calendar_api.dart';
import 'package:everfam/data/models/dto/calendar_event.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CalendarApi)
class CalendarApiImpl implements CalendarApi {
  @override
  Future<void> addEvent() {
    // TODO: implement addEvent
    throw UnimplementedError();
  }

  @override
  Future<List<CalendarEvent>> getEvents() {
    // TODO: implement getEvents
    throw UnimplementedError();
  }

  @override
  Future<void> removeEvent() {
    // TODO: implement removeEvent
    throw UnimplementedError();
  }

}
