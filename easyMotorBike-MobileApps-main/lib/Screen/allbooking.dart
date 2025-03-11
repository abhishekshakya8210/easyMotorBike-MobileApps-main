import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllBookingsPage extends StatefulWidget {
  @override
  State<AllBookingsPage> createState() => _AllBookingsPageState();
}

class _AllBookingsPageState extends State<AllBookingsPage> {
  final List<Map<String, dynamic>> bookings = [
    {
      "name": "Alexander",
      "bike": "Train",
      "rent": "₹3000/day",
      "pickup": "02 Mar, 6:00 AM",
      "return": "16 Mar, 5:00 PM",
      "status": "Pending"
    },
    {
      "name": "Olivia",
      "bike": "Royal Enfield",
      "rent": "₹2000/day",
      "pickup": "02 Mar, 6:00 AM",
      "return": "16 Mar, 5:00 PM",
      "status": "Confirmed"
    },
    {
      "name": "Isabella",
      "bike": "Yamaha R15",
      "rent": "₹1200/day",
      "pickup": "01 Mar, 10:00 AM",
      "return": "03 Mar, 5:00 PM",
      "status": "Confirmed"
    },
    {
      "name": "Sophia",
      "bike": "Royal Enfield",
      "rent": "₹1500/day",
      "pickup": "02 Mar, 12:00 PM",
      "return": "04 Mar, 6:00 PM",
      "status": "Pending"
    },
    {
      "name": "Charlotte",
      "bike": "Honda Activa",
      "rent": "₹500/day",
      "pickup": "05 Mar, 9:00 AM",
      "return": "06 Mar, 2:00 PM",
      "status": "Cancelled"
    }
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("All Booking"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.only(bottom: screenHeight * 0.015),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking["name"],
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Bike: ${booking["bike"]}",
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                          Text("Rent: ${booking["rent"]}",
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                          Text("Pickup: ${booking["pickup"]}",
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                          Text("Return: ${booking["return"]}",
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.005,
                        horizontal: screenWidth * 0.025,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(booking["status"]),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        booking["status"],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Confirmed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}