import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String picture;

  const MemberEntity(
      {required this.firstName, required this.lastName, required this.picture});

  @override
  List<Object?> get props => [firstName, lastName, picture];
}
