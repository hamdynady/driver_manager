import 'package:driver_manager/models/driver_model.dart';

class TravelModel {
  final String clientName;
  final String clientphoneNumber;
  final String contractDate;
  final String startHour;
  final String endHour;
  final String startAddress;
  final String endAddress;
  final double distance;
  final double clientTravelCost;
  final DriverModel driverName;
  final DriverModel driverPhoneNumber;
  final DriverModel driverTravelCost;

  TravelModel({
    required this.clientName,
    required this.clientphoneNumber,
    required this.contractDate,
    required this.startHour,
    required this.endHour,
    required this.startAddress,
    required this.endAddress,
    required this.distance,
    required this.clientTravelCost,
    required this.driverName,
    required this.driverPhoneNumber,
    required this.driverTravelCost,
  });

  factory TravelModel.fromJson(json) {
    return TravelModel(
      clientName: json['clientName'],
      clientphoneNumber: json['clientphoneNumber'],
      contractDate: json['contractDate'],
      startHour: json['startHour'],
      endHour: json['endHour'],
      startAddress: json['startAddress'],
      endAddress: json['endAddress'],
      distance: json['distance'],
      clientTravelCost: json['clientTravelCost'],
      driverName: DriverModel.fromJson(json['driverName']) ,
      driverPhoneNumber:  DriverModel.fromJson(json['driverPhoneNumber']),
      driverTravelCost:  DriverModel.fromJson(json['driverTravelCost']),
    );
  }
}
