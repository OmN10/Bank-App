import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bank_appp/controller/bankcontroller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class TransactionChartScreen extends StatefulWidget {
  @override
  State<TransactionChartScreen> createState() => _TransactionChartScreenState();
}

class _TransactionChartScreenState extends State<TransactionChartScreen> {
  final BankController controller = Get.find();
  final RxString selectedFilter = 'Today'.obs;
  DateTime? customDate;

  Map<String, double> getFilteredStats() {
    final allStats = controller.transactionStats;
    final now = DateTime.now();

    return Map.fromEntries(
      allStats.entries.where((entry) {
        final date = DateTime.tryParse(entry.key);
        if (date == null) return false;

        switch (selectedFilter.value) {
          case 'Today':
            return date.year == now.year &&
                date.month == now.month &&
                date.day == now.day;
          case 'This Week':
            final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
            final endOfWeek = startOfWeek.add(Duration(days: 6));
            return date.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
                date.isBefore(endOfWeek.add(Duration(days: 1)));
          case 'This Month':
            return date.year == now.year && date.month == now.month;
          case 'Custom':
            return customDate != null &&
                date.year == customDate!.year &&
                date.month == customDate!.month &&
                date.day == customDate!.day;
          default:
            return true;
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filters = ['Today', 'This Week', 'This Month', 'Custom'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Transaction Stats",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        final stats = getFilteredStats();
        final entries =
            stats.entries.toList()..sort((a, b) => a.key.compareTo(b.key));

        return Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  isSelected:
                      filters.map((f) => f == selectedFilter.value).toList(),
                  onPressed: (index) async {
                    if (filters[index] == 'Custom') {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: customDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        customDate = picked;
                        selectedFilter.value = 'Custom';
                      }
                    } else {
                      selectedFilter.value = filters[index];
                    }
                  },
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  color: Colors.black,
                  children:
                      filters.map((f) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(f),
                        );
                      }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (selectedFilter.value == 'Custom' && customDate != null)
              Text(
                'Selected: ${DateFormat('dd MMM yyyy').format(customDate!)}',
                style: TextStyle(color: Colors.blue[800], fontSize: 14),
              ),
            SizedBox(height: 10),
            stats.isEmpty
                ? Expanded(child: Center(child: Text("No transactions found")))
                : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BarChart(
                      BarChartData(
                        barGroups:
                            entries.asMap().entries.map((entry) {
                              int index = entry.key;
                              final amount = entry.value.value;
                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: amount,
                                    width: 13,
                                    color: const Color.fromARGB(
                                      255,
                                      135,
                                      201,
                                      194,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                int index = value.toInt();
                                if (index >= entries.length) return SizedBox();
                                return Text(
                                  DateFormat(
                                    'dd-MM',
                                  ).format(DateTime.parse(entries[index].key)),
                                  style: TextStyle(fontSize: 10),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          ],
        );
      }),
    );
  }
}
