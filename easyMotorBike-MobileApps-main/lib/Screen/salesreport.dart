import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesReportPage extends StatefulWidget {
  @override
  _SalesReportPageState createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  String selectedFilter = 'Today';
  final List<String> filters = ['Today', 'Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sales Report",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: filters.map((filter) {
                return ChoiceChip(
                  label: Text(
                    filter,
                    style: const TextStyle(color: Colors.white),
                  ),
                  selected: selectedFilter == filter,
                  selectedColor: Colors.orange,
                  backgroundColor: Colors.green,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _summaryCard("Total Sales", "₹50,000", screenWidth),
                _summaryCard("Total Bookings", "120", screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(child: _buildBarChart()),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard(String title, String value, double screenWidth) {
    return Card(
      color: Colors.orange,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04, horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barGroups: [
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 100, color: Colors.orange)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 150, color: Colors.orange)]),
          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 80, color: Colors.orange)]),
          BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 200, color: Colors.orange)]),
        ],
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
