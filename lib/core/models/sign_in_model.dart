import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  final Data? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  const SignInModel({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      data: json['data'] != null
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'message': message,
      'error': error,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [data, message, error, status];
}

// Data model containing user and token
class Data extends Equatable {
  final User? user;
  final String? token;

  const Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'token': token,
    };
  }

  @override
  List<Object?> get props => [user, token];
}

// User model containing user details
class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? phone;
  final bool? emailVerified;
  final String? image;

  const User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      emailVerified: json['email_verified'] as bool?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phone': phone,
      'email_verified': emailVerified,
      'image': image,
    };
  }

  @override
  List<Object?> get props =>
      [id, name, email, address, city, phone, emailVerified, image];
}
