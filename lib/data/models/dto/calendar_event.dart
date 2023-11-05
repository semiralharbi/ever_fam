import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everfam/data/models/enums/calendar_event_type.dart';
import 'package:everfam/data/models/utils/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_event.freezed.dart';
part 'calendar_event.g.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent({
    required String id,
    required String title,
    required String description,
    @TimestampConverter() required DateTime startDate,
    @TimestampConverter() required DateTime endDate,
    required String creatorId,
    required List<String> assignees,
    required CalendarEventType type,
  }) = _CalendarEvent;

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => _$CalendarEventFromJson(json);
}
