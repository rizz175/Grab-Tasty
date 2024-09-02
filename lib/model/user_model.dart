class UserModel {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  String? longitude;
  String? latitude;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.longitude,
        this.latitude});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
