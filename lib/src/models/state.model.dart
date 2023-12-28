class State {
  int? id;
  String? name;
  String? code;
  String? acronym;
  String? countryId;
  String? createdAt;
  String? updatedAt;

  State(
      {this.id,
      this.name,
      this.code,
      this.acronym,
      this.countryId,
      this.createdAt,
      this.updatedAt});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    acronym = json['acronym'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['acronym'] = acronym;
    data['country_id'] = countryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
