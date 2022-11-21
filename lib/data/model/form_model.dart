

class FormModel {
  int? id;
  String? name;
  String? mobileNo;
  String? email;
  String? dob;
  String? profilePicLink;
  String? status;

  FormModel(
      {this.id,
        this.name,
        this.mobileNo,
        this.email,
        this.dob,
        this.profilePicLink,
        this.status});

  FormModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    dob = json['dob'];
    profilePicLink = json['profilePicLink'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobileNo'] = mobileNo;
    data['email'] = email;
    data['dob'] = dob;
    data['profilePicLink'] = profilePicLink;
    data['status'] = status;
    return data;
  }
}
