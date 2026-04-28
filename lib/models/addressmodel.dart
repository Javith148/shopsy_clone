class AddressModel {
  String fullName;
  String phone;
  String altPhone;
  String pincode;
  String state;
  String city;
  String house;
  String road;
  String landmark;

  AddressModel({
    required this.fullName,
    required this.phone,
    required this.altPhone,
    required this.pincode,
    required this.state,
    required this.city,
    required this.house,
    required this.road,
    required this.landmark,
  });

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phone": phone,
        "altPhone": altPhone,
        "pincode": pincode,
        "state": state,
        "city": city,
        "house": house,
        "road": road,
        "landmark": landmark,
      };

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      fullName: json["fullName"],
      phone: json["phone"],
      altPhone: json["altPhone"],
      pincode: json["pincode"],
      state: json["state"],
      city: json["city"],
      house: json["house"],
      road: json["road"],
      landmark: json["landmark"],
    );
  }
}