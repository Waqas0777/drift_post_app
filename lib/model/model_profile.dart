import 'package:equatable/equatable.dart';

class ModelProfile extends Equatable {
  final int age;
  final String username;
  final String phone;

  const ModelProfile(this.username, this.age, this.phone);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelProfile &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          age == other.age &&
          phone == other.phone;

  @override
  int get hashCode => username.hashCode ^ age.hashCode ^ phone.hashCode;

  @override
  List<Object> get props => [username, age, phone];
}
