class UserEnitiy {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? id;

  UserEnitiy({this.name, this.email, this.phone, this.image, this.id});

  UserEnitiy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}
