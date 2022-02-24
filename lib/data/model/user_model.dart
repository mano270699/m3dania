class UserRegisterModel {
  bool? success;
  Data? data;
  String? message;

  UserRegisterModel({this.success, this.data, this.message});

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  UserModel? user;

  Data({this.accessToken, this.tokenType, this.expiresIn, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? provider;
  String? photo;
  String? deviceToken;
  bool? isOtp;
  String? defaultAddress;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.provider,
      this.photo,
      this.deviceToken,
      this.isOtp,
      this.defaultAddress,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    provider = json['provider'];
    photo = json['photo'];
    deviceToken = json['device_token'];
    isOtp = json['is_otp'];
    defaultAddress = json['default_address'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['provider'] = this.provider;
    data['photo'] = this.photo;
    data['device_token'] = this.deviceToken;
    data['is_otp'] = this.isOtp;
    data['default_address'] = this.defaultAddress;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
