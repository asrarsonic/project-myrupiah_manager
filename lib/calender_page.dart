import 'package:flutter/material.dart';
import 'costum_calender.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB2FF59), Color(0xFFE8F5E9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: child,
      ),
    );
  }
}
