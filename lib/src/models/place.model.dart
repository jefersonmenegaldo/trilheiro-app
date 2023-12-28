import 'package:trilheiro/src/models/city.model.dart';

class Place {
  int? id;
  String? name;
  String? description;
  String? latitude;
  String? longitude;
  String? street;
  String? neighborhood;
  String? number;
  String? complement;
  String? cityId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  City? city;

  Place(
      {this.id,
      this.name,
      this.description,
      this.latitude,
      this.longitude,
      this.street,
      this.neighborhood,
      this.number,
      this.complement,
      this.cityId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.city});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    number = json['number'];
    complement = json['complement'];
    cityId = json['city_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['street'] = street;
    data['neighborhood'] = neighborhood;
    data['number'] = number;
    data['complement'] = complement;
    data['city_id'] = cityId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}