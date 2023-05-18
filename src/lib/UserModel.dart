class UserModel{
  String uid;
  String? email;
  int? totalTime = 0;
  int? currTime = 0;
  List<String>? products;
  bool? vibrate = true;

  UserModel({
    required this.uid,
    this.email,
    this.totalTime,
    this.currTime,
    this.products,
    this.vibrate,
  });


  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'totalTime' : totalTime,
    'currTime' : currTime,
    'products' : products,
    'vibrate' : vibrate,
  };


  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['id'] as String,
    email: json['email'] as String,
    totalTime: json['totalTime'] as int,
    currTime: json['currTime'] as int,
    products: json['products'] as List<String>,
    vibrate: json['vibrate'] as bool,
  );


}

