class User{
  final String userId;
  final String fname;
  final String lname;
  final String email;
  final String mobile;
  User({this.userId,this.fname,this.lname,this.email,this.mobile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['_id'],
      fname: json['fname'],
      lname: json['lname'],
      email: json['email'],
      mobile: json['mobile']
    );
  }
}