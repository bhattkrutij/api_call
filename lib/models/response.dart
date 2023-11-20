class ResponseData {
  String? status;
  String? message;
  List<Data>? data;

  ResponseData({this.status, this.message, this.data});

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? gasStationLogo;
  String? gasStationName;
  String? manuallAddress;
  String? avgPrice;
  double? numOfRating;
  double? averageRating;

  Data({
    this.id,
    this.userId,
    this.gasStationLogo,
    this.gasStationName,
    this.manuallAddress,
    this.numOfRating,
    this.averageRating,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    gasStationLogo = json['gas_station_logo'];
    gasStationName = json['gas_station_name'];
    manuallAddress = json['manuall_address'];
    avgPrice = json["avg_price"].toString();
    numOfRating = json['num_of_rating'].toDouble();
    averageRating = json['average_rating'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['gas_station_logo'] = this.gasStationLogo;
    data['gas_station_name'] = this.gasStationName;
    data['manuall_address'] = this.manuallAddress;
    data['num_of_rating'] = this.numOfRating;
    data["avg_price"] = this.avgPrice;
    data['average_rating'] = this.averageRating;
    return data;
  }
}
