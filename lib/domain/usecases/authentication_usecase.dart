import '/domain/entity/entity.dart';

abstract class AuthenticationUsecase {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String password;

  const AuthenticationParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  factory AuthenticationParams.fromJson(Map<String, dynamic> map) =>
      AuthenticationParams(
        email: map['email'],
        password: map['password'],
      );
}
