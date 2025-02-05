import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalendarPage(
        initialMonth: 'SEPTEMBER',
        initialYear: '2024',
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  final String initialMonth;
  final String initialYear;

  const CalendarPage({
    super.key,
    required this.initialMonth,
    required this.initialYear,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomCalendar(
        initialMonth: initialMonth,
        initialYear: initialYear,
      ),
    );
  }
}

class CustomCalendar extends StatefulWidget {
  final String initialMonth;
  final String initialYear;

  const CustomCalendar({
    super.key,
    required this.initialMonth,
    required this.initialYear,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  int? selectedMonth;
  int? selectedYear;
  final int currentYear = DateTime.now().year;

  late String displayedMonth;
  late int displayedYear;

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
  void initState() {
    super.initState();
    // Initialize with passed values
    displayedMonth = widget.initialMonth;
    displayedYear = int.parse(widget.initialYear);
    // Set initial selected month and year
    selectedMonth = monthNames.indexOf(displayedMonth) + 1;
    selectedYear = displayedYear;
  }

  void updateHeader() {
    if (selectedMonth != null && selectedYear != null) {
      setState(() {
        displayedMonth = monthNames[selectedMonth! - 1];
        displayedYear = selectedYear!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 153, 241, 53), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
                Text(
                  '$displayedMonth $displayedYear',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // ... rest of the code remains the same ...
          const SizedBox(height: 20),
          // Month text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Month',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Month grid
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
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
          // Year text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Year',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Year grid
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selectedYear == year
                        ? const Color(0xFF4169E1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    year.toString(),
                    style: TextStyle(
                      color: selectedYear == year ? Colors.white : Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          // Confirm button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedMonth != null && selectedYear != null
                    ? () {
                        updateHeader();
                        // Kirim data kembali ke HomePage
                        Navigator.pop(context, {
                          'month': displayedMonth,
                          'year': displayedYear.toString()
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 119, 173),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
