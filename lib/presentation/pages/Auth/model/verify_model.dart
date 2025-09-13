class VerifyModel {
  String? name;
  String? phone;
  String? token;
  int? isKyc;

  VerifyModel({this.name, this.phone, this.token, this.isKyc});

  VerifyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    token = json['token'];
    isKyc = json['is_kyc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['token'] = token;
    data['is_kyc'] = isKyc;
    return data;
  }
}