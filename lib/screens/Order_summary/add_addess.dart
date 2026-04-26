import 'package:flutter/material.dart';

class AddDeliveryAddess extends StatefulWidget {
  const AddDeliveryAddess({super.key});

  @override
  State<AddDeliveryAddess> createState() => _AddDeliveryAddessState();
}

class _AddDeliveryAddessState extends State<AddDeliveryAddess> {
  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

     InputDecoration inputStyle(String hint) {
      return InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100, 
        contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: width * 0.035,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), 
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
              Text("Add delivery Address",style: TextStyle(fontSize: width* 0.052,color: Colors.white),)
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

            TextField(decoration: inputStyle("Full Name (Required) *")),
            SizedBox(height: width * 0.04),

            TextField(decoration: inputStyle("Phone number (Required) *")),
            SizedBox(height: width * 0.02),

            Text("+ Add Alternate Phone Number",
                style: TextStyle(color: Colors.blue, fontSize: width * 0.035)),

            SizedBox(height: width * 0.04),

            // PIN + LOCATION
            Row(
              children: [
                Expanded(
                  child: TextField(
                      decoration: inputStyle("Pincode (Required) *")),
                ),
                SizedBox(width: width * 0.03),

                Expanded(
                  child: Container(
                    height: width * 0.12,
                    decoration: BoxDecoration(
                      color: Color(0xFF2874F0), // blue like image
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.my_location,
                            color: Colors.white, size: width * 0.045),
                        SizedBox(width: 6),
                        Text("Use my location",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.032)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: width * 0.04),

            // STATE + CITY
            Row(
              children: [
                Expanded(
                  child:
                      TextField(decoration: inputStyle("State (Required) *")),
                ),
                SizedBox(width: width * 0.03),
                Expanded(
                  child: TextField(
                    decoration: inputStyle("City (Required) *").copyWith(
                      suffixIcon: Icon(Icons.search, size: width * 0.045),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: width * 0.04),

            TextField(
                decoration:
                    inputStyle("House No., Building Name (Required) *")),
            SizedBox(height: width * 0.04),

            TextField(
              decoration: inputStyle(
                      "Road name, Area, Colony (Required) *")
                  .copyWith(
                suffixIcon: Icon(Icons.search, size: width * 0.045),
              ),
            ),

            SizedBox(height: width * 0.02),

            Text(
              "+ Add Nearby Famous Shop/Mall/Landmark",
              style:
                  TextStyle(color: Colors.blue, fontSize: width * 0.035),
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
                    padding: EdgeInsets.symmetric(vertical: width * 0.03),
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
                    padding: EdgeInsets.symmetric(vertical: width * 0.03),
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
              ],
            ),

            SizedBox(height: width * 0.06),

            // SAVE BUTTON
            Container(
              width: double.infinity,
              height: width * 0.13,
              decoration: BoxDecoration(
                color: Colors.deepOrange, // orange like image
                borderRadius: BorderRadius.circular(6), // less rounded
              ),
              alignment: Alignment.center,
              child: Text(
                "Save Address",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      
      ),
      ],
      ),
    );
  }
}