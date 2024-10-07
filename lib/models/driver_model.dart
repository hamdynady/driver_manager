class DriverModel {
  final String driverName;
  final String driverPhone;
  final String driverTravelCost;
  final String driverImage;
  final String dRiverCarImage;

  DriverModel({
    required this.driverName,
    required this.driverPhone,
    required this.driverTravelCost,
    required this.driverImage,
    required this.dRiverCarImage,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
        driverName: json['driverName'],
        driverPhone: json['driverPhone'],
        driverTravelCost: json['driverTravelCost'],
        driverImage: json['driverImage'],
        dRiverCarImage: json['dRiverCarImage']);
  }
}
