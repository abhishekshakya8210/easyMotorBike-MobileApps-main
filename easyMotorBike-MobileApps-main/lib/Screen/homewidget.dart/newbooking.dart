import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentalForm extends StatefulWidget {
  const RentalForm({super.key});

  @override
  RentalFormState createState() => RentalFormState();
}

class RentalFormState extends State<RentalForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pickupDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController totalItemsController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController depositController = TextEditingController();
  TextEditingController rentalAmountController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();

  String? selectedVehicle;
  bool termsAccepted = false;

  void autoFillData() {
    setState(() {
      fullNameController.text = "John Doe";
      dobController.text = "1990-01-01";
      passportController.text = "A12345678";
      licenseController.text = "L98765432";
      countryController.text = "USA";
      addressController.text = "123 Street, City";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("New Booking Form"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                        child: buildTextField("Full Name", fullNameController)),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(child: buildTextField("DOB", dobController)),
                  const SizedBox(width: 10),
                  Expanded(
                      child: buildTextField(
                          "Passport / IC No", passportController)),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: buildTextField("License No", licenseController)),
                  const SizedBox(width: 10),
                  Expanded(child: buildTextField("Country", countryController)),
                ],
              ),

              buildTextField("Address", addressController),

              Row(
                children: [
                  Expanded(
                      child: buildTextField(
                          "PickUp Date/Time", pickupDateController)),
                  const SizedBox(width: 10),
                  Expanded(
                      child: buildTextField(
                          "Return Date/Time", returnDateController)),
                ],
              ),

              Row(
                children: [
                  Expanded(child: _buildDropdownField("Vehicle No")),
                  const SizedBox(width: 10),
                  Expanded(
                      child:
                          buildTextField("Total Items", totalItemsController)),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: buildTextField(
                          "Duration (days)", durationController)),
                  const SizedBox(width: 10),
                  Expanded(
                      child:
                          buildTextField("Advance Deposit", depositController)),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: buildTextField(
                          "Rental Amount", rentalAmountController)),
                  const SizedBox(width: 10),
                  Expanded(
                      child: buildTextField(
                          "Total Amount", totalAmountController)),
                ],
              ),

              CheckboxListTile(
                title: const Text(
                  "I accept Terms & Conditions and Declaration",
                  style: TextStyle(color: Colors.blue),
                ),
                value: termsAccepted,
                onChanged: (newValue) {
                  setState(() {
                    termsAccepted = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && termsAccepted) {
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        value: selectedVehicle,
        items: [
          "Bike-456",
          "Car-123",
        ]
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e,
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedVehicle = value;
          });
        },
        validator: (value) {
          if (value == null) {
            return "Please select $label";
          }
          return null;
        },
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
