import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Topcard extends StatelessWidget {
  const Topcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.520,
          width: MediaQuery.of(context).size.width * 0.950,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.240,
                    width: MediaQuery.of(context).size.width * 0.430,
                    child: buildCircularCard(
                      "Available Vehicle",
                      7,
                      11,
                      Colors.blue,
                      Icons.electric_bike_rounded,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.240,
                    width: MediaQuery.of(context).size.width * 0.430,
                    child: buildCircularCard(
                      "Today's Returns",
                      97,
                      400,
                      Colors.orange,
                      Icons.assignment_return,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.240,
                    width: MediaQuery.of(context).size.width * 0.430,
                    child: buildCircularCard(
                      "Today's Sales",
                      89,
                      200,
                      Colors.red,
                      Icons.trending_up,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.240,
                    width: MediaQuery.of(context).size.width * 0.430,
                    child: buildCircularCard(
                      "Today's Amount",
                      3773,
                      5000,
                      Colors.green,
                      Icons.attach_money,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCircularCard(String title, int achieved, int total,
      Color progressColor, IconData icon) {
    double percentage = achieved / total;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: progressColor),
          const SizedBox(height: 10),
          CircularPercentIndicator(
            radius: 43,
            lineWidth: 8,
            percent: percentage.clamp(0.0, 1.0),
            center: Text(
              "${(percentage * 100).toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            progressColor: progressColor,
            backgroundColor: progressColor.withOpacity(0.2),
          ),
          const SizedBox(height: 10),
          Text(
            '$achieved / $total',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
