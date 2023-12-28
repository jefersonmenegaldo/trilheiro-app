class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? emailVerifiedAt;
  String? phone;
  String? cityId;
  String? createdAt;
  String? updatedAt;
  String? token;

  User({
      this.id,
      this.name,
      this.email,
      this.password,
      this.emailVerifiedAt,
      this.phone,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.token  
    });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    return data;
  }
}
