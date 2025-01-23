import 'package:flutter/material.dart';

class CustomCalendar extends StatefulWidget {
  final Function(String, int) onConfirm;

  const CustomCalendar({super.key, required this.onConfirm});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  int? selectedMonth;
  int? selectedYear;
  final int currentYear = DateTime.now().year;

  final List<String> monthNames = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 112, 238, 49), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              selectedMonth != null
                  ? '${monthNames[selectedMonth! - 1]} ${selectedYear ?? currentYear}'
                  : 'Select a Month and Year',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Month',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(12, (index) {
              final month = index + 1;
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedMonth = month;
                  });
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: selectedMonth == month
                        ? const Color(0xFF4169E1)
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      month.toString(),
                      style: TextStyle(
                        color: selectedMonth == month
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          const Text(
            'Year',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(8, (index) {
              final year = currentYear + index;
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedYear = year;
                  });
                },
                child: Container(
                  width: 60,
                  height: 45,
                  decoration: BoxDecoration(
                    color: selectedYear == year
                        ? const Color(0xFF4169E1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      year.toString(),
                      style: TextStyle(
                        color:
                            selectedYear == year ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF013220),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: selectedMonth != null
                  ? () {
                      widget.onConfirm(
                        monthNames[selectedMonth! - 1],
                        selectedYear ?? currentYear,
                      );
                    }
                  : null,
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
