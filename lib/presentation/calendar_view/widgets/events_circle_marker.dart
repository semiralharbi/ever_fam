import 'package:flutter/material.dart';

class EventCircleMarker extends StatelessWidget {
  const EventCircleMarker({
    super.key,
    required this.eventColor,
  });

  final Color? eventColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.only(top: 6, left: 2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: eventColor ?? Colors.transparent,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
