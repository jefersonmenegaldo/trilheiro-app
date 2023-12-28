
import 'package:trilheiro/src/models/state.model.dart';

class City {
  int? id;
  String? name;
  String? acronym;
  String? stateId;
  String? createdAt;
  String? updatedAt;
  State? state;

  City(
      {this.id,
      this.name,
      this.acronym,
      this.stateId,
      this.createdAt,
      this.updatedAt,
      this.state});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    acronym = json['acronym'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['acronym'] = acronym;
    data['state_id'] = stateId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}