import 'dart:collection';

import 'package:everfam/presentation/calendar_view/utils/utils.dart';
import 'package:everfam/presentation/calendar_view/widgets/events_circle_marker.dart';
import 'package:everfam/theme.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

final headerStyle = HeaderStyle(
  headerMargin: const EdgeInsets.symmetric(horizontal: 26),
  titleCentered: true,
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(
        color: AppColors.blackShadow,
        blurRadius: 2,
      ),
    ],
  ),
  titleTextStyle: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
  ),
  formatButtonVisible: false,
  leftChevronIcon: const Icon(
    Icons.arrow_left_sharp,
    color: AppColors.primary1,
    size: 44,
  ),
  leftChevronMargin: EdgeInsets.zero,
  leftChevronPadding: EdgeInsets.zero,
  rightChevronMargin: EdgeInsets.zero,
  rightChevronPadding: EdgeInsets.zero,
  rightChevronIcon: const Icon(
    Icons.arrow_right_sharp,
    color: AppColors.primary1,
    size: 44,
  ),
);

final calendarStyle = CalendarStyle(
  tablePadding: const EdgeInsets.only(top: 20),
  cellMargin: const EdgeInsets.all(10),
  rangeHighlightColor: AppColors.accent1,
  weekendDecoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  rangeStartDecoration: BoxDecoration(
    color: AppColors.primary2,
    borderRadius: BorderRadius.circular(10),
  ),
  rangeEndDecoration: BoxDecoration(
    color: AppColors.primary2,
    borderRadius: BorderRadius.circular(10),
  ),
  withinRangeDecoration: BoxDecoration(
    color: AppColors.accent1,
    borderRadius: BorderRadius.circular(10),
  ),
  rangeStartTextStyle: const TextStyle(
    color: AppColors.background,
    fontWeight: FontWeight.w900,
  ),
  rangeEndTextStyle: const TextStyle(
    color: AppColors.background,
    fontWeight: FontWeight.w900,
  ),
  selectedDecoration: BoxDecoration(
    color: AppColors.primary1,
    borderRadius: BorderRadius.circular(10),
  ),
  selectedTextStyle: const TextStyle(
    color: AppColors.background,
    fontWeight: FontWeight.w900,
  ),
  todayDecoration: BoxDecoration(
    color: AppColors.accent1,
    borderRadius: BorderRadius.circular(10),
  ),
  todayTextStyle: const TextStyle(
    color: AppColors.black700,
    fontWeight: FontWeight.w600,
  ),
  outsideDecoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  defaultTextStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black700,
  ),
  defaultDecoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
);

final calendarBuilders = CalendarBuilders<Event>(
  singleMarkerBuilder: (context, date, event) {
    Color? eventColor;
    switch (event.eventType) {
      case EventType.home:
        eventColor = Colors.red;
        break;
      case EventType.work:
        eventColor = Colors.blue;
        break;
      case EventType.holiday:
        eventColor = Colors.yellow;
        break;
    }

    return EventCircleMarker(eventColor: eventColor);
  },
);

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(100, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5):
        List.generate(item % 4 + 1, (index) => Event('Event $item | ${index + 1}', EventType.work)),
}..addAll({
    kToday: [
      const Event("Today's Event 1", EventType.home),
      const Event("Today's Event 2", EventType.work),
      const Event("Today's Event 3", EventType.holiday),
      const Event("Today's Event 4", EventType.home),
      const Event("Today's Event 5", EventType.holiday),
      const Event("Today's Event 6", EventType.work),
      const Event("Today's Event 1", EventType.home),
      const Event("Today's Event 2", EventType.work),
      const Event("Today's Event 3", EventType.holiday),
      const Event("Today's Event 4", EventType.home),
      const Event("Today's Event 5", EventType.holiday),
      const Event("Today's Event 6", EventType.work),
      const Event("Today's Event 1", EventType.home),
      const Event("Today's Event 2", EventType.work),
      const Event("Today's Event 3", EventType.holiday),
      const Event("Today's Event 4", EventType.home),
      const Event("Today's Event 5", EventType.holiday),
      const Event("Today's Event 6", EventType.work),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year + 6, kToday.month + 3, kToday.day);
