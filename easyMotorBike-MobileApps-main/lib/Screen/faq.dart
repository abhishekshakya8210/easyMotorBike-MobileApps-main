import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.045; 
    double descriptionFontSize = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('FAQ',style:const TextStyle(fontSize: 25,color: Colors.white,
        fontStyle: FontStyle.italic,fontWeight: FontWeight.w900) ,),
        centerTitle: true,
        
        backgroundColor: Colors.green  ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), 
        child: Column(
          children: [
            ExpansionTile(
              title: Text(
                'What is EasyMotorBike?',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
              iconColor: Colors.black, 
              collapsedIconColor: Colors.black, 
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Text(
                    ' EasyMotorsBike is a bike rental service that allows users to rent bikes for a specific period. It provides a convenient and affordable way to access two-wheelers for travel and commuting.',
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'If I want to cancel my booking, what should I do?',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
          iconColor: Colors.black, 
              collapsedIconColor: Colors.black, 
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Text(
                    'To cancel your booking, go to the "My Bookings" section in the EasyMotorsBike app. Select the booking you want to cancel and click on the "Cancel Booking" option. If cancellation charges apply, they will be displayed before confirming the cancellation.',
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'What happens if the bike gets damaged?',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
            iconColor: Colors.black, 
              collapsedIconColor: Colors.black, 
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Text(
                    ''' If the bike gets damaged during your rental period, you must inform EasyMotorsBike immediately through the app or customer support. The damage will be assessed, and repair costs may be charged based on the extent of the damage and company policy. If insurance is included, it may cover some or all of the costs, depending on the terms and conditions.''',
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Where is the service available?',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
            iconColor: Colors.black, 
              collapsedIconColor: Colors.black,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Text(
                    'EasyMotorsBike services are available in selected cities. To check if we operate in your location, you can visit our app or website. We are continuously expanding to new areas, so stay updated for future availability!',
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}