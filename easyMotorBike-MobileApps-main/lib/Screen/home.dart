import 'package:easymotorbike/Screen/drawer/drawer.dart';
import 'package:easymotorbike/Screen/homewidget.dart/newbooking.dart';
import 'package:easymotorbike/Screen/homewidget.dart/topcard.dart';
import 'package:easymotorbike/generat/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 28,
                color: Colors.black,
              ),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            shadowColor: Colors.black,
            elevation: 4,
            centerTitle: false,
            title: Row(
              children: [
                Image.asset(
                  logo,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  'EasyMotorBike',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    letterSpacing: 2.0,
                    fontFamily: 'Roboto',
                  ),
                )
              ],
            )),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(children: [
              const Topcard(),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const RentalForm());
                          },
                          child: Card(
                            color: Colors.green,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.rate_review_outlined,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'New Booking',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.green,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.app_registration,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'All Booking',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.green,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.car_repair,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'All Vehicles',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.green,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.report,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Sales Reports',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ]),
        ));
  }
}
