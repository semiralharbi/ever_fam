/// Example event class.
class Event {
  const Event(this.title, this.eventType);

  final String title;
  final EventType eventType;

  @override
  String toString() => title;
}

enum EventType {
  work,
  home,
  holiday,
}
