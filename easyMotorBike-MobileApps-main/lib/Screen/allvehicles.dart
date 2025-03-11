import 'package:flutter/material.dart';

class AllVehicles extends StatefulWidget {
  @override
  _AllVehiclesState createState() => _AllVehiclesState();
}

class _AllVehiclesState extends State<AllVehicles> {
  bool isGridView = false;
  List<Map<String, String>> vehicles = [
    {
      "image": "assets/royal.png",
      "name": "Royal Enfield",
      "rent": "₹2000/day",
      "status": "Available"
    },
    {
      "image": "assets/yamaha.png",
      "name": "Yamaha R15",
      "rent": "₹1500/day",
      "status": "Booked"
    },
    {
      "image": "assets/honda.png",
      "name": "Honda Activa",
      "rent": "₹500/day",
      "status": "Available"
    },
     {
      "image": "assets/activa.png",
      "name": "Activa 7G",
      "rent": "₹1500/day",
      "status": "Booked"
    },
     {
      "image": "assets/8g.png",
      "name": " Activa R15",
      "rent": "₹1500/day",
      "status": "Booked"
    },
     {
      "image": "assets/k.png",
      "name": "Yamaha R15",
      "rent": "₹1500/day",
      "status": "Booked"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Vehicles",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w800,color: Colors.white),),

        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: isGridView ? buildGridView() : buildListView(),
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: vehicles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var vehicle = vehicles[index];
        return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(vehicle["image"]!, width: 80, height: 80, fit: BoxFit.cover),
            ),
            title: Text(vehicle["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(vehicle["rent"]!),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Book Now",style: TextStyle(color: Colors.white)),
            ),
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      itemCount: vehicles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        var vehicle = vehicles[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image.asset(vehicle["image"]!, width: double.infinity, height: 100, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vehicle["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(vehicle["rent"]!),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Book Now",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}