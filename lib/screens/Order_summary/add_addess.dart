import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import "package:shopsy/provider/providerclass.dart";
import 'package:provider/provider.dart';
import 'package:shopsy/models/addressmodel.dart';
import 'dart:async';

class AddDeliveryAddess extends StatefulWidget {
  final AddressModel? initialAddress;
  final int? index;
  const AddDeliveryAddess({super.key, this.initialAddress, this.index});

  @override
  State<AddDeliveryAddess> createState() => _AddDeliveryAddessState();
}

class _AddDeliveryAddessState extends State<AddDeliveryAddess> {
  // Text Controllers
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController altPhoneController;
  late TextEditingController pincodeController;
  late TextEditingController stateController;
  late TextEditingController cityController;
  late TextEditingController houseNoController;
  late TextEditingController roadNameController;
  late TextEditingController landmarkController;

  bool showAltPhone = false;
  bool isLandmarkEditing = false;
  bool isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.initialAddress?.fullName);
    phoneController = TextEditingController(text: widget.initialAddress?.phone);
    altPhoneController = TextEditingController(text: widget.initialAddress?.altPhone);
    pincodeController = TextEditingController(text: widget.initialAddress?.pincode);
    stateController = TextEditingController(text: widget.initialAddress?.state);
    cityController = TextEditingController(text: widget.initialAddress?.city);
    houseNoController = TextEditingController(text: widget.initialAddress?.house);
    roadNameController = TextEditingController(text: widget.initialAddress?.road);
    landmarkController = TextEditingController(text: widget.initialAddress?.landmark);
    
    if (widget.initialAddress?.altPhone != null && widget.initialAddress!.altPhone.isNotEmpty) {
      showAltPhone = true;
    }
    if (widget.initialAddress?.landmark != null && widget.initialAddress!.landmark.isNotEmpty) {
      isLandmarkEditing = true;
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    altPhoneController.dispose();
    pincodeController.dispose();
    stateController.dispose();
    cityController.dispose();
    houseNoController.dispose();
    roadNameController.dispose();
    landmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

   
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: 
      Column(
        children: [
          
          Container(
            width: double.infinity,
            height: height *0.09,
            color: const Color(0xFF543CEA),
            child:  Padding(padding: EdgeInsetsGeometry.directional(top: height *0.04,start: width*0.03,bottom: height *0.02 ),child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },child:  Icon(Icons.arrow_back,color: Colors.white,),),
             
              SizedBox(width: width *0.02,),
              Text(widget.initialAddress == null ? "Add delivery Address" : "Edit delivery Address",style: TextStyle(fontSize: width* 0.052,color: Colors.white),)
            ],
          ),)
      ),
         SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color(0xFF543CEA),
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  width: width * 0.25,
                  color: const Color(0xFF543CEA),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF543CEA),
                      width: 1.5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: const Color(0xFF543CEA),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  width: width * 0.25,
                  color: const Color(0xFF543CEA),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF543CEA),
                      width: 1.5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: const Color(0xFF543CEA),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Text("Customer"),

                Text(
                  "\t Order summary \t",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                Text("Payment"),
              ],
            ),
            SizedBox(height: height * 0.02),
            Container(
              height: 3,
              width: double.infinity,
              color: const Color.fromARGB(157, 134, 134, 134),
            ),
            SizedBox(height: height * 0.02),

Padding(
             padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

         TextField(
  controller: fullNameController,
  decoration: InputDecoration(
    labelText: "Full Name (Required) *", 
    floatingLabelBehavior: FloatingLabelBehavior.auto,

    labelStyle: TextStyle(
      fontSize: 15,
      color: Colors.grey,
    ),

    floatingLabelStyle: TextStyle(
      fontSize: 16,
      color: const Color(0xFF543CEA),
      fontWeight: FontWeight.w500,
    ),

    contentPadding: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: const Color(0xFF543CEA), width: 2),
    ),
  ),
),
            SizedBox(height: width * 0.04),

           
         TextField(
          controller: phoneController,
          keyboardType: TextInputType.number,      

 
  decoration: InputDecoration(
    
    labelText: "Phone number (Required) *", 
    floatingLabelBehavior: FloatingLabelBehavior.auto,

    labelStyle: TextStyle(
      fontSize: 15,
      color: Colors.grey,
    ),

    floatingLabelStyle: TextStyle(
      fontSize: 16,
      color: const Color(0xFF543CEA),
      fontWeight: FontWeight.w500,
    ),

    contentPadding: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: const Color(0xFF543CEA), width: 2),
    ),
  ),
),
            SizedBox(height: width * 0.02),
            if (showAltPhone) ...[
  TextField(
    controller: altPhoneController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: "Alternate Phone Number",
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      labelStyle: TextStyle(fontSize: 15, color: Colors.grey),

      floatingLabelStyle: TextStyle(
        fontSize: 16,
        color: Color(0xFF543CEA),
        fontWeight: FontWeight.w500,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFF543CEA), width: 2),
      ),
    ),
  ),
  SizedBox(height: width * 0.02),
],

 SizedBox(height: width * 0.01),
GestureDetector(
  onTap: () {
    setState(() {
      showAltPhone = !showAltPhone; 
    });
  },
  child: Text(
    "+ Add Alternate Phone Number",
    style: TextStyle(
      color: Colors.blue,
      fontSize: width * 0.035,
    ),
  ),
),

            SizedBox(height: width * 0.06),

            Row(
              children: [
                Expanded(
                  child:  TextField(
    controller: pincodeController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: "Pincode (Required)*",
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      labelStyle: TextStyle(fontSize: 14, color: Colors.grey[800]),

      floatingLabelStyle: TextStyle(
        fontSize: 16,
        color: Color(0xFF543CEA),
        fontWeight: FontWeight.w500,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFF543CEA), width: 2),
      ),
    ),
  ),
                ),
                SizedBox(width: width * 0.03),

                Expanded(
                  child: GestureDetector(
                    onTap: isLoadingLocation ? null : _getCurrentLocation,
                    child: Container(
                      height: width * 0.085,
                      decoration: BoxDecoration(
                        color: isLoadingLocation ? Colors.grey : Color(0xFF2874F0), 
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isLoadingLocation
                              ? SizedBox(
                                  width: width * 0.04,
                                  height: width * 0.04,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : Icon(Icons.my_location,
                                  color: Colors.white, size: width * 0.045),
                          SizedBox(width: 6),
                          Text(isLoadingLocation ? "Getting location..." : "Use my location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.038,
                                  fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: width * 0.04),

            Row(
              children: [
                 Expanded(
                  child:  TextField(
    controller: stateController,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: "State (Required)*",
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      labelStyle: TextStyle(fontSize: 14, color: Colors.grey[800]),

      floatingLabelStyle: TextStyle(
        fontSize: 16,
        color: Color(0xFF543CEA),
        fontWeight: FontWeight.w500,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFF543CEA), width: 2),
      ),
    ),
  ),
                ),
                SizedBox(width: width * 0.03),
                  Expanded(
                  child:  TextField(
    controller: cityController,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: "city (Required)*",
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      labelStyle: TextStyle(fontSize: 14, color: Colors.grey[800]),

      floatingLabelStyle: TextStyle(
        fontSize: 16,
        color: Color(0xFF543CEA),
        fontWeight: FontWeight.w500,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFF543CEA), width: 2),
      ),
    ),
  ),
                ),
              ],
            ),

            SizedBox(height: width * 0.04),

           TextField(
    controller: houseNoController,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: "House No, Building Name (Required)*",
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      labelStyle: TextStyle(fontSize: 14, color: Colors.grey[800]),

      floatingLabelStyle: TextStyle(
        fontSize: 16,
        color: Color(0xFF543CEA),
        fontWeight: FontWeight.w500,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFF543CEA), width: 2),
      ),
    ),
  ),
            SizedBox(height: width * 0.04),

         TextField(
  controller: roadNameController,
  keyboardType: TextInputType.text,
  decoration: InputDecoration(
    labelText: "Road Name,Area,Colony (Required)*",
    floatingLabelBehavior: FloatingLabelBehavior.auto,

    labelStyle: TextStyle(fontSize: 14, color: Colors.grey[800]),

    floatingLabelStyle: TextStyle(
      fontSize: 16,
      color: Color(0xFF543CEA),
      fontWeight: FontWeight.w500,
    ),

    suffixIcon: Icon(
      Icons.search,
      color: Colors.grey,
    ),

    contentPadding: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Color(0xFF543CEA), width: 2),
    ),
  ),
),

            SizedBox(height: width * 0.02),

       isLandmarkEditing
    ? TextField(
        controller: landmarkController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Nearby Famous Shop/Mall/Landmark",
          floatingLabelBehavior: FloatingLabelBehavior.auto,

          labelStyle: TextStyle(fontSize: 14, color: Colors.grey[800]),

          floatingLabelStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF543CEA),
            fontWeight: FontWeight.w500,
          ),

          

          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xFF543CEA),
              width: 2,
            ),
          ),
        ),
      )
    : GestureDetector(
        onTap: () {
          setState(() {
            isLandmarkEditing = true;
          });
        },
        child: Text(
          "+ Add Nearby Famous Shop/Mall/Landmark",
          style: TextStyle(
            color: Colors.blue,
            fontSize: width * 0.035,
          ),
        ),
      ),

            SizedBox(height: width * 0.04),

            Text("Type of address",
                style: TextStyle(
                    fontSize: width * 0.038, fontWeight: FontWeight.w500)),

            SizedBox(height: width * 0.02),

            Row(
              children: [

                // HOME CHIP
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: width * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: width * 0.045),
                        SizedBox(width: 6),
                        Text("Home"),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: width * 0.03),

                // WORK CHIP
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: width * 0.015),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.work, size: width * 0.045),
                        SizedBox(width: 6),
                        Text("Work"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: width *0.43,)
              ],
            ),

            SizedBox(height: width * 0.03),

            // SAVE BUTTON
        GestureDetector(
  onTap: () async {
    if (fullNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        pincodeController.text.isEmpty ||
        stateController.text.isEmpty ||
        cityController.text.isEmpty ||
        houseNoController.text.isEmpty ||
        roadNameController.text.isEmpty) {
      _showError("Please fill all required fields (*)");
      return;
    }

    AddressModel address = AddressModel(
      fullName: fullNameController.text,
      phone: phoneController.text,
      altPhone: altPhoneController.text,
      pincode: pincodeController.text,
      state: stateController.text,
      city: cityController.text,
      house: houseNoController.text,
      road: roadNameController.text,
      landmark: landmarkController.text,
    );

    if (widget.index != null) {
      await Provider.of<AddressProvider>(context, listen: false)
          .updateAddress(widget.index!, address);
      _showSuccess("Address Updated Successfully");
    } else {
      await Provider.of<AddressProvider>(context, listen: false)
          .addAddress(address);
      _showSuccess("Address Saved Successfully");
    }

    Navigator.pop(context); // go back
  },
  child: Container(
    width: double.infinity,
    height: width * 0.11,
    color: Colors.deepOrange,
    alignment: Alignment.center,
    child: Text(widget.initialAddress == null ? "Save Address" : "Update Address",
        style: TextStyle(color: Colors.white)),
  ),
)
          ],
        ),
      
      ),
      ],
      ),
     ) );
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      isLoadingLocation = true;
    });

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showError('Please enable location services from settings');
        setState(() => isLoadingLocation = false);
        return;
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showError('Location permission is required');
          setState(() => isLoadingLocation = false);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _showError('Please enable location permission in app settings');
        setState(() => isLoadingLocation = false);
        return;
      }

      // Get current position with timeout
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 30),
      ).timeout(
        const Duration(seconds: 35),
        onTimeout: () {
          throw TimeoutException('Location request timed out. Please try again.');
        },
      );

      // Get address from coordinates with error handling
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          final Placemark place = placemarks.first;

         setState(() {
  pincodeController.text = place.postalCode ?? '';

  stateController.text = place.administrativeArea ?? '';

  cityController.text =
      place.locality ??
      place.subAdministrativeArea ??
      place.administrativeArea ??
      '';

  houseNoController.text =
      place.name ??
      place.subLocality ??
      '';

  roadNameController.text =
      place.thoroughfare ??
      place.subLocality ??
      place.street ??
      '';

  landmarkController.text =
      place.subLocality ??
      place.locality ??
      '';

  isLoadingLocation = false;
});
          _showSuccess('Location details filled successfully!');
        } else {
          _showError('Unable to fetch address. Please enter manually.');
          setState(() => isLoadingLocation = false);
        }
      } catch (e) {
        _showError('Geocoding failed. Please enter address manually.');
        setState(() => isLoadingLocation = false);
      }
    } on TimeoutException {
      _showError('Location request timed out. Check your internet and GPS.');
      setState(() => isLoadingLocation = false);
    } on PlatformException catch (e) {
      String errorMsg = 'Location error: ${e.message}';
      if (e.code == 'PERMISSION_DENIED') {
        errorMsg = 'Location permission denied';
      } else if (e.code == 'LOCATION_SERVICES_DISABLED') {
        errorMsg = 'Enable location services in settings';
      } else if (e.code == 'UNAVAILABLE') {
        errorMsg = 'Location services unavailable. Try enabling GPS.';
      }
      _showError(errorMsg);
      setState(() => isLoadingLocation = false);
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.contains('TIMEOUT')) {
        _showError('Location request timed out. Please try again.');
      } else if (errorMessage.contains('PERMISSION')) {
        _showError('Location permission required');
      } else {
        _showError('Error: ${e.toString()}');
      }
      setState(() => isLoadingLocation = false);
    }
  }

  void _showError(String message) {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
}