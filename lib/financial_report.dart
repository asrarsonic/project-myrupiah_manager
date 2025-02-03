import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancialReportPage extends StatelessWidget {
  const FinancialReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
        title: const Text(
          'Financial Report',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Column(
              children: const [
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '2025',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_drop_down, size: 30),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: 1000,
                height: 300,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 30000,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Jan';
                            case 1:
                              return 'Feb';
                            case 2:
                              return 'Mar';
                            case 3:
                              return 'Apr';
                            case 4:
                              return 'May';
                            case 5:
                              return 'Jun';
                            case 6:
                              return 'Jul';
                            case 7:
                              return 'Aug';
                            case 8:
                              return 'Sep';
                            case 9:
                              return 'Oct';
                            case 10:
                              return 'Nov';
                            case 11:
                              return 'Dec';
                            default:
                              return '';
                          }
                        },
                        margin: 8,
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTitles: (double value) {
                          if (value % 5000 == 0) {
                            return 'Rp ${value.toInt()}';
                          }
                          return '';
                        },
                        reservedSize: 40,
                        margin: 8,
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey,
                          strokeWidth: 1,
                        );
                      },
                      drawVerticalLine: false,
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    barGroups: [
                      makeGroupData(0, 15000, 10000, 5000),
                      makeGroupData(1, 20000, 15000, 7000),
                      makeGroupData(2, 25000, 20000, 8000),
                      makeGroupData(3, 30000, 25000, 10000),
                      makeGroupData(4, 20000, 15000, 6000),
                      makeGroupData(5, 25000, 20000, 9000),
                      makeGroupData(6, 30000, 25000, 11000),
                      makeGroupData(7, 20000, 15000, 7000),
                      makeGroupData(8, 25000, 20000, 8000),
                      makeGroupData(9, 30000, 25000, 10000),
                      makeGroupData(10, 20000, 15000, 6000),
                      makeGroupData(11, 25000, 20000, 9000),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Budget',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Income',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Expenses',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Column(
              children: const [
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Income and Total Expense',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 30,
                      sections: [
                        PieChartSectionData(
                          value: 40,
                          color: Colors.green,
                          title: '',
                        ),
                        PieChartSectionData(
                          value: 60,
                          color: Colors.red,
                          title: '',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Income:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '+ Rp 40.000',
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total Expense:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '- Rp 40.000',
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catatan:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Anda telah menggunakan 50% dari anggaran bulan ini.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [Colors.green],
          width: 10,
          borderRadius: BorderRadius.zero,
        ),
        BarChartRodData(
          y: y2,
          colors: [Colors.red],
          width: 10,
          borderRadius: BorderRadius.zero,
        ),
        BarChartRodData(
          y: y3,
          colors: [Colors.blue],
          width: 10,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }
}
