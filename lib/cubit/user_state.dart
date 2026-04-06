part of 'user_cubit.dart';

// Base state class should extend Equatable for better performance
abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

// Checkbox state - now properly extends UserState
final class SignInCheckBoxState extends UserState {
  final bool isChecked;
   const SignInCheckBoxState(this.isChecked);

  @override
  List<Object?> get props => [isChecked];
}
final class SignInLoading extends UserState{}
final class SignInSuccess extends UserState{}
final class SignInFailure extends UserState{
  final String error;
  SignInFailure({required this.error});
}
final class SignUPLoading extends UserState{}
final class SignUPSuccess extends UserState{}
final class SignUPFailure extends UserState{
  final String error;
  SignUPFailure({required this.error});
}