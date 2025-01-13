import 'package:flutter/material.dart';
import 'costum_calender.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: AndroidPhoneFrame(
              child: CustomCalendar(
                onConfirm: (selectedMonth, selectedYear) {
                  Navigator.pop(context, {
                    'month': selectedMonth,
                    'year': selectedYear,
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AndroidPhoneFrame extends StatelessWidget {
  final Widget child;

  const AndroidPhoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 700,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade800,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: child,
      ),
    );
  }
}
