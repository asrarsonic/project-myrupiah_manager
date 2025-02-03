import 'package:flutter/material.dart';

class EditBudgetPage extends StatefulWidget {
  final String selectedMonth;
  final String selectedYear;
  final Map<String, double> initialBudgets;

  const EditBudgetPage({
    super.key,
    required this.selectedMonth,
    required this.selectedYear,
    required this.initialBudgets,
  });

  @override
  State<EditBudgetPage> createState() => _EditBudgetPageState();
}

class _EditBudgetPageState extends State<EditBudgetPage> {
  late Map<String, TextEditingController> controllers;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    controllers = {
      'Bills': TextEditingController(
          text: formatNumber(widget.initialBudgets['Bills'] ?? 300000)),
      'Shopping': TextEditingController(
          text: formatNumber(widget.initialBudgets['Shopping'] ?? 150000)),
      'Education': TextEditingController(
          text: formatNumber(widget.initialBudgets['Education'] ?? 200000)),
      'Subscription': TextEditingController(
          text: formatNumber(widget.initialBudgets['Subscription'] ?? 80000)),
      'Health': TextEditingController(
          text: formatNumber(widget.initialBudgets['Health'] ?? 100000)),
      'Food': TextEditingController(
          text: formatNumber(widget.initialBudgets['Food'] ?? 250000)),
      'Family': TextEditingController(
          text: formatNumber(widget.initialBudgets['Family'] ?? 100000)),
      'Transport': TextEditingController(
          text: formatNumber(widget.initialBudgets['Transport'] ?? 39432)),
      'Other': TextEditingController(
          text: formatNumber(widget.initialBudgets['Other'] ?? 15000)),
    };
  }

  String formatNumber(double value) {
    return value.toStringAsFixed(0);
  }

  Future<void> saveBudgetData(Map<String, double> budgetData) async {}

  void showSaveSuccessDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Budget successfully updated!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showSaveErrorDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to save budget. Please try again.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 137, 247, 64),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Edit Budget',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.selectedMonth,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.selectedYear,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Budget Amount',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: controllers.entries.map((entry) {
                          return _buildBudgetEditRow(entry.key, entry.value);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[350],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: isSaving
                        ? null
                        : () async {
                            setState(() {
                              isSaving = true;
                            });

                            try {
                              final editedBudgets = {
                                for (var entry in controllers.entries)
                                  entry.key: double.tryParse(entry.value.text
                                          .replaceAll(',', '')) ??
                                      0.0
                              };

                              await saveBudgetData(editedBudgets);

                              showSaveSuccessDialog();

                              Navigator.pop(context, editedBudgets);
                            } catch (e) {
                              showSaveErrorDialog();
                            } finally {
                              setState(() {
                                isSaving = false;
                              });
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 117, 247, 57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: Text(
                      isSaving ? 'Saving...' : 'Confirm',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetEditRow(
      String category, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category),
          Row(
            children: [
              Text('Rp'),
              SizedBox(
                width: 120,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ),
              const Icon(Icons.edit, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
