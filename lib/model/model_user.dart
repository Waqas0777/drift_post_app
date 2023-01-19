import 'package:equatable/equatable.dart';

class ModelUser extends Equatable {
  final int id;
  final String email;
  final String password;

  const ModelUser(this.id, this.email, this.password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ModelUser &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              email == other.email &&
              password == other.password ;

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  List<Object> get props => [id, email, password];
}