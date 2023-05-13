class UserModel{
  String id;
  String? email;
  int? totalTime = 0;
  int? currTime = 0;
  String uid;

  UserModel({
    required this.id,
    this.email,
    this.totalTime,
    this.currTime,
    required this.uid,
  });


  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'totalTime' : totalTime,
    'currTime' : currTime,
    'uid': uid,
  };


  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as String,
    email: json['email'] as String,
    totalTime: json['totalTime'] as int,
    currTime: json['currTime'] as int,
    uid: json['uid'] as String,
  );

}

