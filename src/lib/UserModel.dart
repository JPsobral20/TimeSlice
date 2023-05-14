class UserModel{
  String id;
  String? email;
  int? totalTime = 0;
  int? currTime = 0;
  String uid;
  List<String>? products;

  UserModel({
    required this.id,
    this.email,
    this.totalTime,
    this.currTime,
    required this.uid,
    this.products,
  });


  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'totalTime' : totalTime,
    'currTime' : currTime,
    'uid': uid,
    'products' : products,
  };


  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as String,
    email: json['email'] as String,
    totalTime: json['totalTime'] as int,
    currTime: json['currTime'] as int,
    uid: json['uid'] as String,
    products: json['products'] as List<String>,
  );

}

