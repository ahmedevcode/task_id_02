part of 'inputform_cubit.dart';

@immutable
abstract class InputformState {}

class InputformInitial extends InputformState {}

class InputformSuccess extends InputformState {
  final String? name;
  final String? email;
  final String? phone;

  InputformSuccess({
    this.name,
    this.email,
    this.phone,
  });
}

class Inputformloading extends InputformState {}

class Inputformfailure extends InputformState {}
