import 'package:equatable/equatable.dart';
import 'package:error_handler/application/base_error.dart';

class AccountEntity extends Equatable {
  final String token;

  const AccountEntity({required this.token});

  factory AccountEntity.fromJson(Map<String, dynamic> map) {
    if (map['token'] == null) throw InvalidDataError();
    return AccountEntity(
      token: map['token'],
    );
  }

  @override
  List<Object> get props => [token];
}
